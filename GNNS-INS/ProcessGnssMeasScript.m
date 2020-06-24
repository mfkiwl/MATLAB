prFileName = 'pseudoranges_log_2016_08_22_14_45_50.txt';
dirName = '~/Documents/MATLAB/GNSS opensource/demoFiles';
%% Set the data filter and Read log file
dataFilter = SetDataFilter;
[gnssRaw,gnssAnalysis] = ReadRawGnss(dirName,prFileName,dataFilter);
if isempty(gnssRaw), return, end
%% Get online ephemeris from Nasa ftp, first compute UTC Time from gnssRaw:
