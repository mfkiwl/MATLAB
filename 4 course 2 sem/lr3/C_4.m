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
n = 0:(N-1); % ���������� ������������� �����
k = 0:(N-1); % ���������� ������������� �������
x1 = zeros(1, N);
for i = 1:N
    if i == 1
        x1(i) = 1;
    else
        x1(i) = 0;
    end
end
MOD_K = abs(fft(x1)); % ������ ��� �������� ������������������
figure('Name','DFT Modulus and Amplitude Spectrum', 'NumberTitle','off')
subplot(2,1,1), stem(n,x1, 'MarkerSize',3,'Linewidth',2)
grid, xlabel('n')
ylabel('x(n)'), title(strcat(['Periodic Sequence x1(n) N = ',num2str(N)]))
subplot(2,1,2), stem(k,MOD_K,'MarkerSize',3,'Linewidth',2), grid
xlabel('k'), ylabel('|X1(k)|')
title('DFT Modulus of the Finite Sequence')


