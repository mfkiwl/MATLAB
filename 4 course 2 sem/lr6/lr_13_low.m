script
clc
clear
disp('% �� ?13. ������ ���-������� ��� ������� ����������� Z-��������������')
disp('%')
Nb = 4; % ����� �������
Fs = 5000 + 100*Nb; % ������� ������������� (��)
ft = Fs/10 + 20*Nb; % ��������� ������� �� (��)
fk = Fs/10 + 250 + 25*Nb; % ��������� ������� �� (��)
rp = 0.4455; % ����������� ���������� ��������� � ��
rs = 40; % ���������� ���������� ��������� � ��
disp('%')
disp('% �.2. ������ ���-�������� �����������, �������� I � II ���� � ����������-������')
disp('%')
disp('% ��� ������� ���-�������� ��� ������� <ENTER>')
pause
WDp = ft/(Fs/2); WDs = fk/(Fs/2); % ��������� ������������� ������� �� � ��
[R1,WDn1] = buttord(WDp,WDs,rp,rs); % ������� � ������� ����� ���-������� ��� �����������
[R2,WDn2] = cheb1ord(WDp,WDs,rp,rs);% ������� � ������� ����� ���-������� �������� I ����
[R3,WDn3] = cheb2ord(WDp,WDs,rp,rs);% ������� � ������� ����� ���-������� ��� �������� II ����
[R4,WDn4] = ellipord(WDp,WDs,rp,rs);% ������� � ������� ����� ���-������� ��� ����������-������
[b1,a1] = butter(R1,WDn1); % ������������ ���-������� ��� �����������
[b2,a2] = cheby1(R2,rp,WDn2); % ������������ ���-������� ��� �������� I ����
[b3,a3] = cheby2(R3,rs,WDn3); % ������������ ���-������� ��� �������� II ����
[b4,a4] = ellip(R4,rp,rs,WDn4); % ������������ ���-������� ��� ����������-������
disp('%')
disp('% ��� ������ �������� ���-�������� ��� ������� <ENTER>')
pause
disp('%')
disp([' R1 = ' num2str(R1),' R2 = ' num2str(R2),' R3 = ' num2str(R3),' R4 = ' num2str(R4)])
disp('%')
disp('% ��� ����������� ������� <ENTER>')
pause
disp('%')
disp('% �.3. ������ ������������� ���-�������� ���')
disp('%')
disp('% ��� ������ ������������� ���-�������� ��� (������ ����������� ����) ������� <ENTER>')
pause
figure('Name','Lowpass IIR Filter Butterworth','NumberTitle', 'off')
plot_iir(b1,a1,Fs) % �������������� ���-������� ��� �����������
figure('Name','Lowpass IIR Filter Chebyshov I','NumberTitle', 'off')
plot_iir(b2,a2,Fs) % �������������� ���-������� ��� �������� II ����
figure('Name','Lowpass IIR Filter Chebyshov II','NumberTitle', 'off')
plot_iir(b3,a3,Fs) % �������������� ���-������� ��� �������� II ����
figure('Name','Lowpass IIR Filter Elliptic','NumberTitle', 'off')
plot_iir(b4,a4,Fs) % �������������� ���-������� ��� ����������-������
disp('%')
disp('% ��� ����������� ������� <ENTER>')
pause
disp('%')
disp('% �.4. ������ ��� �����������, �������� I � II ���� � ����������-������')
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
[Ra1,Wn1] = buttord(Wp,Ws,rp,rs,'s'); % ������� � ������� ����� ��� ��� �����������
[Ra2,Wn2] = cheb1ord(Wp,Ws,rp,rs,'s'); % ������� � ������� ����� ��� ��� �������� I ����
[Ra3,Wn3] = cheb2ord(Wp,Ws,rp,rs,'s'); % ������� � ������� ����� ��� ��� �������� II ����
[Ra4,Wn4] = ellipord(Wp,Ws,rp,rs,'s'); % ������� � ������� ����� ��� ��� ����������-������
[bs1,as1] = butter(Ra1,Wn1,'s'); % ������������ ��� ��� �����������
[bs2,as2] = cheby1(Ra2,rp,Wn2,'s'); % ������������ ��� ��� �������� I ����
[bs3,as3] = cheby2(Ra3,rs,Wn3,'s'); % ������������ ��� ��� �������� II ����
[bs4,as4] = ellip(Ra4,rp,rs,Wn4,'s'); % ������������ ��� ��� ����������-������
disp('%')
disp('%')
disp('% ��� ������ �������� ��� ��� ������� <ENTER>')
pause
disp('%')
disp('%')
disp([' Ra1 = ' num2str(Ra1),' Ra2 = ' num2str(Ra2),' Ra3 = ' num2str(Ra3),' Ra4 = ' num2str(Ra4)])
disp('%')
disp('%')
disp('% ��� ����������� ������� <ENTER>')
pause
disp('%')
disp('%')
disp('% �.5. ����� �������� ��� ��� �����������, �������� I � II ���� � ����������-������')
disp('%')
disp('%')
disp('% ��� ������ �������� ��� ��� ������� <ENTER>')
pause
f = 0:((Fs/2)/1000):Fs/2; % ����� ������ ��� ������� ���
W = 2.*pi.*f;
Ha1 = freqs(bs1,as1,W); MAG1 = abs(Ha1); % �� � ��� ��� ��� �����������
Ha2 = freqs(bs2,as2,W); MAG2 = abs(Ha2); % �� � ��� ��� ��� �������� I ����
Ha3 = freqs(bs3,as3,W); MAG3 = abs(Ha3); % �� � ��� ��� ��� �������� II ����
Ha4 = freqs(bs4,as4,W); MAG4 = abs(Ha4); % �� � ��� ��� ��� ����������-������
figure('Name','Lowpass Analog Filter ? Magnitude','NumberTitle', 'off')
subplot(2,2,1),plot(f,abs(Ha1)),xlabel('f(Hz)'),grid,...
    ylabel('MAGNITUDE'),title('Analog Filter Butterworth'),ylim([0 1.2])
subplot(2,2,2),plot(f,abs(Ha2)),xlabel('f(Hz)'),grid,...
    ylabel('MAGNITUDE'),title('Analog Filter Chebyshov I'),ylim([0 1.2])
subplot(2,2,3),plot(f,abs(Ha3)),xlabel('f(Hz)'),grid,...
    ylabel('MAGNITUDE'),title('Analog Filter Chebyshov II'),ylim([0 1.2])
subplot(2,2,4),plot(f, abs(Ha4)),xlabel('f(Hz)'),grid,...
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
F_lowpass_scale = scale(F_lowpass) % ��������� ���������������
disp('%')
disp('% ��� ������ ��� � ������� ������ GUI FVTool ������� <ENTER>')
pause
disp('%')
fvtool(F_lowpass_scale)
disp('%')
disp('% ������ ���-������� ��� ��������')
