function [gnssRaw,gnssAnalysis] = ReadRawGnss(dirName,fileName, dataFilter, gnssAnalysis)
%% Initialize outputs and inputs
gnssRaw = [];
gnssAnalysis.GnssClockErrors = 'GnssClock Errors.';
gnssAnalysis.GnssMeasurementErrors = 'GnssMeasurement Errors.';
gnssAnalysis.ApiPassFail = '';
if nargin<3, dataFilter = []; end

%% check we have the right kind of fileName
extension = fileName(end-3:end);
if ~any(strcmp(extension,{'.txt','.csv'}))
    error('Expecting file name of the form "*.txt", or "*.csv"');
end

%% read log file into a numeric matrix 'S', and a cell array 'header'
rawCsvFile = MakeCsv(dirName,fileName);
[header,C] = ReadRawCsv(rawCsvFile);

%% apply dataFilter 
[bOk] = CheckDataFilter(dataFilter,header);
if ~bOk, return, end
[bOk,C] = FilterData(C,dataFilter,header);
if ~bOk, return, end

%% pack data into gnssRaw structure
[gnssRaw,missing] = PackGnssRaw(C,header);

%% check clock and measurements
[gnssRaw,gnssAnalysis] = CheckGnssClock(gnssRaw,gnssAnalysis);
gnssAnalysis = ReportMissingFields(gnssAnalysis,missing);


end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function csvFileName = MakeCsv(dirName,fileName)
%% make csv file, if necessary. 
if (dirName(end)~='/')
    dirName = [dirName, '/'];
end
csvFileName = [dirName, 'raw.csv'];
if strcmp(fileName(end-3:end), '.csv') %already csv file
    return;
end
extendedFileName = [dirName, fileName];
fprintf('\nReading file %s\n',extendedFileName);
txtFileID = fopen(extendedFileName, 'r');
csvFileID = fopen(csvFileName, 'w');
line = '';
while ischar(line)
    line = fgetl(txtFileID);
    if isempty(strfind(line, 'Raw,')) %go to next string
        continue;
    end
    line = strrep(line, 'Raw,', '');
    line = strrep(line, '#', '');
    line = strrep(line, ' ', '');
    fprintf(csvFileName, '%s\n', line);
end
fclose(txtFileName);
fclose(csvFileName);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [header, C] = ReadRawCsv(rawCsvFile)
%% read data from csv file into a numerical matrix 'S' and cell array 'header'

fID = fopen(rawCsvFile);
if fID<0
    error('file %s not found', rawCsvFile);
end

headerString = fgetl(fID);
if isempty(strfind(headerString,'TimeNanos'))
    error('\n"TimeNanos" string not found in file %s\n', rawCsvFile);
end

header = textscan(headerString,'%s','Delimiter',','); 
header = header{1}; %this makes header a numFieldsx1 cell array
numFields = size(header,1);

%check that numFields == size(S,2)
[~,M] = size(S); %M = number of columns
assert(numFields==M,...
 '# of header names is different from # of columns of numerical data');
formatSpec='';
for i=1:M
    %longs
    if i == find(strcmp(header,'TimeNanos')) || ...
            i == find(strcmp(header,'FullBiasNanos')) || ...
            i == find(strcmp(header,'ReceivedSvTimeNanos')) || ...
            i == find(strcmp(header,'ReceivedSvTimeUncertaintyNanos')) || ...
            i == find(strcmp(header,'CarrierCycles'))
        formatSpec = sprintf('%s %%d64',formatSpec);
    elseif 0
        %ints
        % TBD maybe %d32 for ints: AccumulatedDeltaRangeState, ...
        %  ConstellationType, MultipathIndicator, State, Svid
        formatSpec = sprintf('%s %%d32',formatSpec);
    else
        %everything else doubles
        formatSpec = sprintf('%s %%f',formatSpec);
    end
end
%for empty fields, enter 'NaN' into csv
C = textscan(fID,formatSpec,'Delimiter',',','EmptyValue',NaN); %textscan attempts to
%match the data in the file to the conversion specifier in formatSpec. 
%The textscan function reapplies formatSpec throughout the entire file and stops when
%it cannot match formatSpec to the data.
fclose(fID);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [b0k, C] = FilterData(C, dataFilter, header)
%% filter C based on contents of dataFilter

b0k = true;
is = ones(size(C{1}));
for i=1:size(dataFilter,1)
    j=find(strcmp(header,dataFilter{i,1}));%j = index into header
    %we should always be a value of j, because checkDataFilter checks for this:
    assert(any(j),'dataFilter{i} = %s not found in header\n',dataFilter{i,1})
    
    %now we must evaluate the expression in dataFilter{i,2}, for example:
    % 'BiasUncertaintyNanos < 1e7'
    %assign the relevant cell of C to a variable with same name as the header
    ts = sprintf('%s = C{%d};',header{j},j);
    eval(ts);
    %create an index vector from the expression in dataFilter{i,2}
    ts = sprintf('iSi = %s;',dataFilter{i,2});
    eval(ts);
    
    %AND the iS index values on each iteration of i
    iS = iS & iSi;
end
% Check if filter removes all values
if ~any(iS) %if all zeros
    fprintf('\nAll measurements removed. Specify dataFilter less strictly than this:, ')
    dataFilter(:,2)
    bOk=false;
    C=[];
    return
end

% Keep only those values of C indexed by iS
for i=1:length(C)
    C{i} = C{i}(iS);
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [gnssRaw,missing] = PackGnssRaw(C,header)
%% check clock values in gnssRaw
assert(length(C)==length(header),...
    'length(C) ~= length(header). This should have been checked before here')

gnssRaw = [];
%report clock fields present/missing, based on: 
gnssClockFields = {...
    'TimeNanos'
    'TimeUncertaintyNanos'
    'LeapSecond'
    'FullBiasNanos'
    'BiasUncertaintyNanos'
    'DriftNanosPerSecond'
    'DriftUncertaintyNanosPerSecond'
    'HardwareClockDiscontinuityCount'
    'BiasNanos'
    };
missing.ClockFields = {};

%report measurements fields present/missing, based on: 
gnssMeasurementFields = {...
    'Cn0DbHz'
    'ConstellationType'
    'MultipathIndicator'
    'PseudorangeRateMetersPerSecond'
    'PseudorangeRateUncertaintyMetersPerSecond'
    'ReceivedSvTimeNanos'
    'ReceivedSvTimeUncertaintyNanos'
    'State'
    'Svid'
    'AccumulatedDeltaRangeMeters'
    'AccumulatedDeltaRangeUncertaintyMeters'
    };
%leave these out for now, 'cause we dont care (for now), or they're deprecated, 
% or they could legitimately be left out (because they are not computed in
% a particular GNSS implementation)
% SnrInDb, TimeOffsetNanos, CarrierFrequencyHz, CarrierCycles, CarrierPhase, 
% CarrierPhaseUncertainty
missing.MeasurementFields = {};

%pack data into vector variables, if the fields are not NaNs
for j = 1:length(header)
    if any(isfinite(C{j})) %not all NaNs
        %TBD what if there are some NaNs, but not all. i.e. some missing
        %data in the log file - TBD deal with this
        eval(['gnssRaw.',header{j}, '=C{j};']);
    elseif any(strcmp(header{j},gnssClockFields))
        missing.ClockFields{end+1} = header{j};
    elseif any(strcmp(header{j},gnssMeasurementFields))
        missing.MeasurementFields{end+1} = header{j};
    end
end
%So, if a field is not reported, it will be all NaNs from makeCsv, and the above
%code will not load it into gnssRaw. So when we call 'CheckGnssClock' it can
%check for missing fields in gnssRaw.

%TBD look for all zeros that can not legitimately be all zero, 
%e.g. AccumulatedDeltaRangeMeters, and report these as missing data
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [gnssRaw,gnssAnalysis,bOk] = CheckGnssClock(gnssRaw,gnssAnalysis)
%% check clock values in gnssRaw
bOk = true;
sFail = ''; %initialize string to record failure messafes
N = length(gnssRaw.ReceivedSvTimeNanos);
%Insist on the presence of TimeNanos (time from hw clock)
if ~isfield(gnssRaw,'TimeNanos')
    s = ' TimeNanos  missing from GnssLogger File.';
    fprintf('WARNING: %s\n',s);
    sFail = [sFail,s];
    bOk = false;
end
if ~isfield(gnssRaw,'FullBiasNanos')
    s = 'FullBiasNanos missing from GnssLogger file.';
    fprintf('WARNING: %s, we need it to get the week number\n',s);
    sFail = [sFail,s];
    bOk = false;
end
if ~isfield(gnssRaw,'BiasNanos')
    gnssRaw.BiasNanos = zeros(N,1);
end
if ~isfield(gnssRaw,'HardwareClockDiscontinuityCount')
    %possibly non fatal error, we assume there is no hardware clock discontinuity
    %so we set to zero and move on, but we print a warning
    gnssRaw.HardwareClockDiscontinuityCount = zeros(N,1);
    fprintf('WARNING: Added HardwareClockDiscontinuityCount=0 because it is missing from GNSS Logger file\n');
end

%check FullBiasNanos, it should be negative values
bChangeSign = any(gnssRaw.FullBiasNanos<0) & any(gnssRaw.FullBiasNanos>0);
assert(~bChangeSign,...
    'FullBiasNanos changes sign within log file, this should never happen');
%Now we know FullBiasNanos doesnt change sign,auto-detect sign of FullBiasNanos, 
%if it is positive, give warning and change
if any(gnssRaw.FullBiasNanos>0)
    gnssRaw.FullBiasNanos = -1*gnssRaw.FullBiasNanos;
    fprintf('WARNING: FullBiasNanos wrong sign. Should be negative. Auto changing inside ReadGpsLogger\n');
    gnssAnalysis.GnssClockErrors = [gnssAnalysis.GnssClockErrors,...
        sprintf(' FullBiasNanos wrong sign.')];
end

%compute full cycle time of measurement, in milliseonds
gnssRaw.allRxMillis = int64((gnssRaw.TimeNanos - gnssRaw.FullBiasNanos)*1e-6); %true gps time since 0000Z, 6 January 1980
%allRxMillis is now accurate to one millisecond (because it's an integer)

if ~bOk
    gnssAnalysis.ApiPassFail = ['FAIL ',sFail]; 
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function gnssAnalysis = ReportMissingFields(gnssAnalysis,missing)
%% report missing clock and measurement fields in gnssAnalysis
%report missing clock fields
if ~isempty(missing.ClockFields)
    gnssAnalysis.GnssClockErrors = sprintf(...
        '%s Missing Fields:',gnssAnalysis.GnssClockErrors);
    for i=1:length(missing.ClockFields)
    gnssAnalysis.GnssClockErrors = sprintf(...
        '%s %s,',gnssAnalysis.GnssClockErrors,missing.ClockFields{i});
    end
    gnssAnalysis.GnssClockErrors(end) = '.';%replace final comma with period
end

%report missing measurement fields
if ~isempty(missing.MeasurementFields)
    gnssAnalysis.GnssMeasurementErrors = sprintf(...
        '%s Missing Fields:',gnssAnalysis.GnssMeasurementErrors);
    for i=1:length(missing.MeasurementFields)
    gnssAnalysis.GnssMeasurementErrors = sprintf(...
        '%s %s,',gnssAnalysis.GnssMeasurementErrors,...
        missing.MeasurementFields{i});
    end
    gnssAnalysis.GnssMeasurementErrors(end) = '.';%replace last comma with period
end

%assign pass/fail
if ~any(strfind(gnssAnalysis.ApiPassFail,'FAIL')) %didn't already fail
    if isempty(missing.ClockFields) && isempty(missing.MeasurementFields)
        gnssAnalysis.ApiPassFail = 'PASS';
    else
        gnssAnalysis.ApiPassFail = 'FAIL BECAUSE OF MISSING FIELDS';
    end
end
end