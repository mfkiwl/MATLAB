Nb = 50; % ����� �������
%1c
Fs = 5000 + 100*Nb; % ������� ������������� (��)
ft = Fs/10 + 20*Nb;% ��������� ������� �� (��)
fk = Fs/10 + 250 + 25*Nb; % ��������� ������� �� (��)
d1 = 0.05; % ����������� ���������� ���������� � ��
d2 = 0.01; % ����������� ���������� ���������� � ��
Ap = 0.4455; % ����������� ���������� ��������� � ��
Ast = 40; % ���������� ���������� ��������� � ��
b1 = func_1c(Fs, ft, fk, d1, d2);
pause
% 2c-3c
f1 = 312.5;
f2 = 2500;
A1 = 10;
A2 = 4;
[input, reaction] = func_2c(b1, Fs, A1, A2, f1, f2); % N*f1, N*f2 ������ ������ �������� �� FS ����� ������ �� ���������� (N=64)

% 4c
% MAG_lowpass = fdesign.lowpass('Fp,Fst,Ap,Ast',ft,fk,Ap,Ast,Fs);
% F_lowpass = equiripple(MAG_lowpass);
% fvtool(F_lowpass)