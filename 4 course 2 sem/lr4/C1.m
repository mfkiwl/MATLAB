clc
clear
Nb = 4; % ����� ������� (������� �� ��������)
N = 64; % ����� (������) ������������������ 1
M = 71; % ����� (������) ������������������ 2
Fs = 2000*mod(Nb, 5) + 1; % ������� ������������� (��)
A1 = 1 + 0.01*Nb; % ��������� ���������� ��������
A2 = 2*A1;
f1 = Fs/4; % ������� ���������� �������� (��)
f2 = 1.5*f1;

disp('%')
disp('% �.1. �������� ��������� ���������')
n = 0:(N-1); % ���������� ������������� �����
k = 0:(N-1); % ���������� ������������� �������
w1 = 2*pi*f1/Fs; w2 = 2*pi*f2/Fs; % ������������� ������� ���������� ��������(���)
x = A1*cos(w1*n)+A2*cos(w2*n); % ������������������(������ N)
X = fft(x); % ��� ������������������
E1 = sum(x.^2); % ������� ������������������, ����������� �� �� ��������
E2 = (1/N)*sum(abs(X).^2); % ������� ������������������, ����������� �� �������� ���
disp('%')
disp('% ��� ������ ����� (E1) � ������ (E2) ������ ��������� ��������� ������� <ENTER>')
pause
disp('%')
disp([' E1 = ',num2str(E1),' E2 = ' num2str(E2)])
disp('%')
disp('% ��� ����������� ������� <ENTER>')
pause
disp('%')

n = 0:(M-1); % ���������� ������������� �����
k = 0:(M-1); % ���������� ������������� �������
x = A1*cos(w1*n)+A2*cos(w2*n); % ������������������(������ N)
X = fft(x); % ��� ������������������
E1 = sum(x.^2); % ������� ������������������, ����������� �� �� ��������
E2 = (1/M)*sum(abs(X).^2); % ������� ������������������, ����������� �� �������� ���
disp('%')
disp('% ��� ������ ����� (E1) � ������ (E2) ������ ��������� ��������� ������� <ENTER>')
pause
disp('%')
disp([' E1 = ',num2str(E1),' E2 = ' num2str(E2)])
disp('%')
disp('% ��� ����������� ������� <ENTER>')
pause
disp('%')
disp('% ������ ���������')