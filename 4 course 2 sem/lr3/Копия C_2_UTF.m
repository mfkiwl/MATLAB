all_figs = findobj(0, 'type', 'figure'); % ���� ���� ������� ����� �����
delete(all_figs)
clc
clear
%%
    Nb = 4; % ����� �������
    N = 64; % ����� (������) ������������������
    Fs = 2000*(mod(Nb, 5) + 1); % ������� �������������
    T = 1/Fs; % ������ ������������� 1/Fs
    A1 = 1+0.01*Nb; % ��������� ���������� ��������
    A2 = 2*A1;
    f1 = Fs/8; % ������� (��) ���������� ��������
    f2 = Fs/12;

%%    
N = N/2;
n = 0:(N-1); % ���������� ������������� �����
k = 0:(N-1); % ���������� ������������� �������
w1 = 2*pi*f1/Fs; w2 = 2*pi*f2/Fs; 
x = A1*cos(w1*n+pi/4)+A2*cos(w2*n+pi/8); % ������������� ������������������    
MOD_K = abs(fft(x)); % ������ ��� �������� ������������������
PHASE = angle(fft(x));
figure('Name','DFT Modulus and Amplitude Spectrum', 'NumberTitle','off')
stem(k,MOD_K,'MarkerSize',3,'Linewidth',2), grid
xlabel('k'), ylabel('|X(k)|')
title('DFT Modulus of the Finite Sequence')

figure('Name','Phase Spectrum','NumberTitle', 'off')
stem(k, PHASE,'MarkerSize',3,'Linewidth',2), grid
xlabel('k'), ylabel('arg{X(k)} (rad)')
title(strcat(['Phase Spectrum of the Periodic Sequence N = ',num2str(N)]))