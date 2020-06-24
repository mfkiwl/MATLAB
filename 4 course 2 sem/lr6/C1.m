script
clc
clear
disp('% �� ?13. ������ ���-������� ��� ����������-������ � ������������� ������������ � ���-�� ���������')
disp('%')
    Nb = 4; % ����� �������
    Fs = 7000 + 100*Nb; % ������� ������������� (��)(choose randomly, but smartly)
    ft = Fs/10 + 20*Nb; % ��������� ������� �� (��)(choose randomly, but smartly)
    fk = Fs/10 + 250 + 25*Nb; % ��������� ������� �� (��)(choose randomly, but smartly)
    rp = 1.0; % ����������� ���������� ��������� � �� (choose randomly, but smartly)
    rs = 25; % ���������� ���������� ��������� � �� (choose randomly, but smartly)
disp('%')
disp('% �.2. ������ ���-�������� �����������, �������� I � II ���� � ����������-������')
disp('%')
disp('% ��� ������� ���-�������� ��� ������� <ENTER>')
pause
WDp = ft/(Fs/2); WDs = fk/(Fs/2); % ��������� ������������� ������� �� � ��
[R4,WDn4] = ellipord(WDp,WDs,rp,rs);% ������� � ������� ����� ���-������� ��� ����������-������
[b4,a4] = ellip(R4,rp,rs,WDn4); % ������������ ���-������� ��� ����������-������
disp('%')
disp('% ��� ������ �������� ���-�������� ��� ������� <ENTER>')
pause
disp('%')
disp([' R4 = ' num2str(R4)])
disp('%')
disp('% ��� ����������� ������� <ENTER>')
pause
disp('%')
disp('% �.3. ������ ������������� ���-������� ���')
disp('%')
disp('% ��� ������ ������������� ���-������� ��� ����������-������ ������� <ENTER>')
pause
figure('Name','Lowpass IIR Filter Elliptic','NumberTitle', 'off')
plot_iir(b4,a4,Fs) % �������������� ���-������� ��� ����������-������
disp('%')
disp('% ��� ����������� ������� <ENTER>')
pause
disp('%')
disp('% �.4. ������ ��� ����������-������')
disp('%')
disp('% ��� ������ ��������� ������ ��� ��� �� (Ft) � �� (Fk) ������� <ENTER>')
pause
disp('%')
Ft = (Fs/pi)*tan(pi*ft/Fs); Fk = (Fs/pi)*tan(pi*fk/Fs); % ��������� ������� ��� �� ���
disp([' Ft = ' num2str(Ft),' Fk = ' num2str(Fk)])
disp('%')
disp('%')
disp('% ��� ������� ��� ��� ������� <ENTER>')
pause
Wp = 2.*pi.*Ft; Ws = 2.*pi.*Fk; % ��������� �������� ������� �� � �� ���
[Ra4,Wn4] = ellipord(Wp,Ws,rp,rs,'s'); % ������� � ������� ����� ��� ��� ����������-������
[bs4,as4] = ellip(Ra4,rp,rs,Wn4,'s'); % ������������ ��� ��� ����������-������
disp('%')
disp('%')
disp('% ��� ������ �������� ��� ��� ������� <ENTER>')
pause
disp('%')
disp('%')
disp([' Ra4 = ' num2str(Ra4)])
disp('%')
disp('%')
disp('% ��� ����������� ������� <ENTER>')
pause
disp('%')
disp('%')
disp('% �.5. ����� ������� ��� ��� ����������-������')
disp('%')
disp('%')
disp('% ��� ������ �������� ��� ��� ������� <ENTER>')
pause
f = 0:((Fs/2)/1000):Fs/2; % ����� ������ ��� ������� ���
W = 2.*pi.*f;
Ha4 = freqs(bs4,as4,W); MAG4 = abs(Ha4); % �� � ��� ��� ��� ����������-������
figure('Name','Lowpass Analog Filter ? Magnitude','NumberTitle', 'off')
plot(f, abs(Ha4)),xlabel('f(Hz)'),grid,...
    ylabel('MAGNITUDE'),title('Analog Filter Elliptic'),ylim([0 1.2])
disp('%')
disp('%')
disp('% ��� ����������� ������� <ENTER>')
pause
disp('%')
disp('%')
disp('% �.6. �������� ���������� � ��� ���-������� � ���� ������� fdesign')
disp('%')
disp('%')
disp('% ��� ������ ������� ������� fdesign ������� <ENTER>')
pause
MAG_lowpass = fdesign.lowpass('Fp,Fst,Ap,Ast',ft,fk,rp,rs,[Fs]) % ������ fdesign ��� ���
disp('%')
disp('%')
disp('% ��� ����������� ������� <ENTER>')
pause
disp('%')
disp('%')
disp('% �.7. ������ ���-������� ��� ����������-������ � ���� ������� dfilt')
disp('%')
disp('%')
disp('% ��� ������ ������� ������� dfilt ������� <ENTER>')
pause
F_lowpass = design(MAG_lowpass,'ellip','MatchExactly', 'both','FilterStructure','df2sos') % ��� � ���� ������� dfilt
disp('%')
disp('%')
disp('% ��� ����������� ������� <ENTER>')
pause
disp('%')
disp('%')
disp('% �.8. ��������������� � ��������� ��������� ���-������� ��� ����������-������')
disp('%')
disp('%')
disp('% ��� ������ ������� ������� dfilt ����� ��������������� ������� <ENTER>')
pause
F_lowpass_scale = scale(F_lowpass, 'L2') % ��������� ���������������
disp('%')
disp('% ��� ������ ��� � ������� ������ GUI FVTool ������� <ENTER>')
pause
disp('%')
fvtool(F_lowpass_scale)
disp('%')
disp('% ������ ���-������� ��� ��������')