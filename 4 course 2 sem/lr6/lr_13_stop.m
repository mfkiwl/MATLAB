script
clc
clear
disp('% �� ?13. ������ ���-������� �� ������� ����������� Z-��������������')
disp('%')
    Nb = 4; % ����� �������
    Fs = 5000 + 100*Nb; % ������� ������������� � ��
    ft1 = Fs/20 + 20*Nb; % ��������� ������� ��1 � ��
    fk1 = Fs/20 + 250 + 25*Nb; % ��������� ������� ��1 � ��
    fk2 = Fs/4 + 25*Nb; % ��������� ������� ��2 � ��
    ft2 = Fs/4 + 250 + 30*Nb; % ��������� ������� ��2 � ��
    rp = 0.4455; % ����������� ���������� ��������� � ��
    rs = 40; % ���������� ���������� ��������� � ��
disp('% �.2. ������ ���-�������� �����������, �������� I � II ���� � ����������-������')
disp('%')
disp('%')
disp('% ��� ������� ���-�������� �� ������� <ENTER>')
pause
ft = [ft1 ft2]; fk = [fk1 fk2]; % ������� ��������� ������ �� � ��
WDp = ft/(Fs/2); WDs = fk/(Fs/2); % ������� ��������� ������������� ������ �� � ��
[R1,WDn1] = buttord(WDp,WDs,rp,rs); % ������� � ������� ����� ���-������� �� �����������
[R2,WDn2] = cheb1ord(WDp,WDs,rp,rs); % ������� � ������� ����� ���-������� �� �������� I ����
[R3,WDn3] = cheb2ord(WDp,WDs,rp,rs); % ������� � ������� ����� ���-������� �� �������� II ����
[R4,WDn4] = ellipord(WDp,WDs,rp,rs); % ������� � ������� ����� ���-������� �� ����������-������
[b1,a1] = butter(R1,WDn1,'stop'); % ������������ ���-������� �� �����������
[b2,a2] = cheby1(R2,rp,WDn2,'stop'); % ������������ ���-������� �� �������� I ����
[b3,a3] = cheby2(R3,rs,WDn3,'stop'); % ������������ ���-������� �� �������� II ����
[b4,a4] = ellip(R4,rp,rs,WDn4,'stop'); % ������������ ���-������� �� ����������-������
disp('%')
disp('%')
disp('% ��� ������ �������� ���-�������� �� ������� <ENTER>')
pause
disp('%')
disp('%')
disp([' R1 = ' num2str(R1),' R2 = ' num2str(R2),' R3 = ' num2str(R3),' R4 = ' num2str(R4)])
disp('%')
disp('%')
disp('% ��� ����������� ������� <ENTER>')
pause
disp('%')
disp('%')
disp('% �.3. ������ ������������� ���-�������� ��')
disp('%')
disp('%')
disp('% ��� ������ ������������� ���-�������� �� (������ ����������� ����) ������� <ENTER>')
pause
figure('Name','Bandstop IIR Filter Butterworth','NumberTitle', 'off')
plot_iir(b1,a1,Fs) % �������������� ���-������� �� �����������
figure('Name','Bandstop IIR Filter Chebyshov I','NumberTitle', 'off')
plot_iir(b2,a2,Fs) % �������������� ���-������� �� �������� II ����
figure('Name','Bandstop IIR Filter Chebyshov II','NumberTitle', 'off')
plot_iir(b3,a3,Fs) % �������������� ���-������� �� �������� II ����
figure('Name','Bandstop IIR Filter Elliptic','NumberTitle', 'off')
plot_iir(b4,a4,Fs) % �������������� ���-������� �� ����������-������
disp('%')
disp('%')
disp('% ��� ����������� ������� <ENTER>')
pause
disp('%')
disp('%')
disp('% �.4. ������ ��� �����������, �������� I � II ���� � ����������-������')
disp('%')
disp('%')
disp('% ��� ������ ��������� ������ ��� �� ��1 (Ft1), ��1 (Fk1), ��2 (Fk2) � ��2 (Ft2) ������� <ENTER>')
pause
disp('%')
disp('%')
ft = [ft1 ft2]; fk = [fk1 fk2]; % ������� ��������� ������ �� � �� ���-�������
Ft = (Fs/pi)*tan(pi*ft/Fs); Fk = (Fs/pi)*tan(pi*fk/Fs); % ������� ��������� ������ �� � �� ���
disp([' Ft1 = ' num2str(Ft(1)),' Fk1 = ' num2str(Fk(1)),' Fk2 = ' num2str(Fk(2)),' Ft2 = ' num2str(Ft(2))])
disp('%')
disp('%')
disp('% ��� ������� ��� �� ������� <ENTER>')
pause
Wp = 2.*pi.*Ft; Ws = 2.*pi.*Fk; % ������� ��������� �������� ������ �� � �� ���
[Ra1,Wn1] = buttord(Wp,Ws,rp,rs,'s'); % ������� � ������� ����� ��� �� �����������
[Ra2,Wn2] = cheb1ord(Wp,Ws,rp,rs,'s'); % ������� � ������� ����� ��� �� �������� I ����
[Ra3,Wn3] = cheb2ord(Wp,Ws,rp,rs,'s'); % ������� � ������� ����� ��� �� �������� II ����
[Ra4,Wn4] = ellipord(Wp,Ws,rp,rs,'s'); % ������� � ������� ����� ��� �� ����������-������
[bs1,as1] = butter(Ra1,Wn1,'stop','s'); % ������������ ��� �� �����������
[bs2,as2] = cheby1(Ra2,rp,Wn2,'stop','s'); % ������������ ��� �� �������� I ����
[bs3,as3] = cheby2(Ra3,rs,Wn3,'stop','s'); % ������������ ��� �� �������� II ����
[bs4,as4] = ellip(Ra4,rp,rs,Wn4,'stop','s'); % ������������ ��� �� ����������������
disp('%')
disp('%')
disp('% ��� ������ �������� ��� �� ������� <ENTER>')
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
f =0 :((Fs/2)/1000):Fs/2; % ����� ������ ��� ������� ���
W = 2.*pi.*f;
Ha1 = freqs(bs1,as1,W); % �� ��� �����������
Ha2 = freqs(bs2,as2,W); % �� ��� �������� I ����
Ha3 = freqs(bs3,as3,W); % �� ��� �������� II ����
Ha4 = freqs(bs4,as4,W); % �� ��� ����������-������
figure('Name','Bandstop Analog Filter ? Magnitude','NumberTitle', 'off')
subplot(2,2,1),plot(f,abs(Ha1)),xlabel('f(Hz)'),grid,...
    ylabel('MAGNITUDE'),title('Analog Filter Butterworth'),ylim([0 1.2])
subplot(2,2,2),plot(f,abs(Ha2)),xlabel('f(Hz)'),grid,...
    ylabel('MAGNITUDE'),title('Analog Filter Chebyshov I'),ylim([0 1.2])
subplot(2,2,3),plot(f,abs(Ha3)),xlabel('f(Hz)'),grid,...
    ylabel('MAGNITUDE'),title('Analog Filter Chebyshov II'),ylim([0 1.2])
subplot(2,2,4),plot(f,abs(Ha4)),xlabel('f(Hz)'),grid,...
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
MAG_bandstop = fdesign.bandstop('Fp1,Fst1,Fst2,Fp2,Ap1,Ast,Ap2',ft1,fk1,fk2,ft2,rp,rs,rp,[Fs]) % ������ fdesign ��� ��
disp('%')
disp('%')
disp('% ��� ����������� ������� <ENTER>')
pause
disp('%')
disp('%')
disp('% �.7. ������ ���-������� �� ����������-������ � ���� ������� dfilt')
disp('%')
disp('%')
disp('% ��� ������ ������� ������� dfilt ������� <ENTER>')
pause
F_bandstop = design(MAG_bandstop,'ellip','MatchExactly', 'both','FilterStructure','df2sos') % �� � ���� ������� dfilt
disp('%')
disp('%')
disp('% ��� ����������� ������� <ENTER>')
pause
disp('%')
disp('%')
disp('% �.8. ��������������� � ��������� ��������� ���-������� �� ����������������')
disp('%')
disp('%')
disp('% ��� ������ ������� ������� dfilt ����� ��������������� ������� <ENTER>')
pause
F_bandstop_scale = scale(F_bandstop,'L2') % ��������� ���������������
disp('%')
disp('% ��� ������ ��� � ������� ������ GUI FVTool ������� <ENTER>')
pause
disp('%')
fvtool(F_bandstop_scale)
disp('% ������ ���-������� �� ��������')