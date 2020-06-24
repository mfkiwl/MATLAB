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
w1 = 2*pi*f1/Fs; w2 = 2*pi*f2/Fs; 
x1 = zeros(1, N);
for i = 1:N
    if i < N/2
        x1(i) = A1*cos(w1*i); % ������������� ������������������ 
    else
        x1(i) = A2*cos(w2*(i - N/2));
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


x = A1*cos(w1*n+pi/4)+A2*cos(w2*n+pi/8); % ������������� ������������������
MOD_K = abs(fft(x)); % ������ ��� �������� ������������������
figure('Name','DFT Modulus and Amplitude Spectrum', 'NumberTitle','off')
subplot(2,1,1), stem(n,x, 'MarkerSize',3,'Linewidth',2)
grid, xlabel('n')
ylabel('x(n)'), title(strcat(['Periodic Sequence x(n) N = ',num2str(N)]))
subplot(2,1,2), stem(k,MOD_K,'MarkerSize',3,'Linewidth',2), grid
xlabel('k'), ylabel('|X(k)|')
title('DFT Modulus of the Finite Sequence');