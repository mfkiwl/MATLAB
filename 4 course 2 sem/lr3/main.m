% all_figs = findobj(0, 'type', 'figure'); -- ���� ���� ������� ����� �����
% delete(all_figs)
clc
clear
disp('% �� ?9. ���������� �������������� ����� (����� 1)')
% disp('%')
% disp('%')
% disp('% ������� �������� ������');
    Nb = 4; % ����� �������
    N = 64; % ����� (������) ������������������
    Fs = 2000*(mod(Nb, 5) + 1); % ������� �������������
    T = 1/Fs; % ������ ������������� 1/Fs
    A1 = 1+0.01*Nb; % ��������� ���������� ��������
    A2 = 2*A1;
    f1 = Fs/8; % ������� (��) ���������� ��������
    f2 = Fs/12;
% DATA=0;
% while DATA==0
%     Nb = input('Nb = '); % ����� �������
%     N = input('N = '); % ����� (������) ������������������
%     Fs = input('Fs = '); % ������� �������������
%     T = input('T = '); % ������ ������������� 1/Fs
%     A1 = input('A1 = '); % ��������� ���������� ��������
%     A2 = input('A2 = ');
%     f1 = input('f1 = '); % ������� (��) ���������� ��������
%     f2 = input('f2 = ');
%     disp('% ��������� ������������ ����� �������� ������')
%     disp('% ��� ���������� �������� ������ ������� 1')
%     disp('% ��� ������������ �������� ������ ������� 0 � ��������� ����')
%     DATA = input('--> ');
% end
disp('%')
disp('% ��� ������ �������� �������� � ������ ���������� �������� �������<ENTER>')
pause
disp('%')
disp([' A1 = ' num2str(A1) ' A2 = ' num2str(A2)])
disp([' f1 = ' num2str(f1) ' f2 = ' num2str(f2)])
disp('%')
disp('%')
disp('% ��� ����������� ������� <ENTER>')
pause
disp('%')
disp('%')
%%
disp('% �.1. ���������� ������������ � �������� �������� ������������� ������������������')
disp('%')
disp('%')
disp('% ��� ������ �������� ������������� ������������������ ������� <ENTER>')
pause
n = 0:(N-1); % ���������� ������������� �����
k = 0:(N-1); % ���������� ������������� �������
w1 = 2*pi*f1/Fs; w2 = 2*pi*f2/Fs; % ������������� ������� ���������� �������� (���)
x = A1*cos(w1*n+pi/4)+A2*cos(w2*n+pi/8); % ������������� ������������������
X = fft(x); % ��� ������������� ������������������
MOD = (2/N)*abs(X); % ����������� ������ ������������� ������������������
MOD(1) = (1/N)*abs(X(1));
PHASE = angle(X); % ������� ������ ������������� ������������������
for i = 1:N
    if (abs(X(i)) < 1e-4)
        PHASE(i)=0;
    end
end
figure('Name','Periodic Sequence','NumberTitle','off')
subplot(3,1,1), stem(n,x, 'MarkerSize',3,'Linewidth',2)
grid, xlabel('n')
ylabel('x(n)'), title(strcat(['Periodic Sequence x(n) N = ',num2str(N)]))
subplot(3,1,2), stem(n/Fs,x,'MarkerSize',3,'Linewidth',2)
grid, xlabel('nT')
ylabel('x(nT)'), title(strcat(['Periodic Sequence x(nT) N = ',num2str(N)]))
x = ifft(X); % ������������� ������������������,����������� � ������� ����
subplot(3,1,3), stem(n,x,'MarkerSize',3,'Linewidth',2)
grid, xlabel('n')
ylabel('x(n)'), title(strcat(['Periodic Sequence x = ifft(X) N =',num2str(N)]))
disp('%')
disp('%')
disp('% ��� ������ �������� ������������ ������� ������������� ������������������ ������� <ENTER>')
pause
figure('Name','Amplitude Spectrum','NumberTitle', 'off')
subplot(2,1,1), stem(k,MOD,'MarkerSize',3,'Linewidth',2), grid
xlabel('k'), ylabel('1/N|X(k)|')
title(strcat(['Amplitude Spectrum of the Periodic Sequence N = ',num2str(N)]))
subplot(2,1,2), stem(k*(Fs/N),MOD,'MarkerSize',3,'Linewidth',2),grid
xlabel('f (Hz)'), ylabel('1/N|X(f)|')
title(strcat(['Amplitude Spectrum of the Periodic Sequence N = ',num2str(N)]))
disp('%')
disp('%')
disp('% ��� ������ �������� �������� ������� ������������� ������������������ ������� <ENTER>')
pause
figure('Name','Phase Spectrum','NumberTitle', 'off')
subplot(2,1,1), stem(k, PHASE,'MarkerSize',3,'Linewidth',2), grid
xlabel('k'), ylabel('arg{X(k)} (rad)')
title(strcat(['Phase Spectrum of the Periodic Sequence N = ',num2str(N)]))
subplot(2,1,2), stem(k*(Fs/N),PHASE,'MarkerSize',3,'Linewidth',2)
grid, xlabel('f (Hz)'), ylabel('arg{X(f)} (rad)')
title(strcat(['Phase Spectrum of the Periodic Sequence N = ',num2str(N)]))
disp('%')
disp('%')
disp('% ��� ����������� ������� <ENTER>')
pause
disp('%')
disp('%')
%%
disp('% �.2. ���������� ��� �������� ������������������')
disp('%')
disp('%')
disp('% ��� ������ �������� ������ ��� �������� ������������������ � ������������ �������')
disp('% ������������� ������������������ ������� <ENTER>')
pause
MOD_K = abs(fft(x)); % ������ ��� �������� ������������������
figure('Name','DFT Modulus and Amplitude Spectrum', 'NumberTitle','off')
subplot(2,1,1), stem(k,MOD_K,'MarkerSize',3,'Linewidth',2), grid
xlabel('k'), ylabel('|X(k)|')
title('DFT Modulus of the Finite Sequence')
subplot(2,1,2), stem(k,MOD,'MarkerSize',3,'Linewidth',2), grid
xlabel('k'), ylabel('1/N |X(k)|')
title('Amplitude Spectrum of the Periodic Sequence')
disp('%')
disp('%')
disp('% ��� ����������� ������� <ENTER>')
pause
disp('%')
disp('%')
%%
disp('% �.3. ����������� �������� � ������ ���������� ��������')
disp('%')
disp('%')
disp('% ��� ������ �������� ���������� ������� fft_e1 ������� <ENTER>')
pause
e1 = 1e-7; % �������� ������ ��� ������� ��������
[MODm,m] = fft_e1(MOD,e1); % ������� ������� ��� ��������� �������� � ������ �������� ��������� ������� �� ������� ��������
disp('%')
disp('%')
disp('% ��� ������ �������� � ������ ���������� �������� ������� <ENTER>')
pause
A1 = MODm(1); A2 = MODm(2); % ��������� ���������� ��������
k1 = m(1); k2 = m(2); % ���������� ������������� �������
f1 = k1*Fs/N; f2 = k2*Fs/N; % ������� (��) ���������� ��������
disp('%')
disp('%')
disp([' A1 = ' num2str(A1) ' A2 = ' num2str(A2)])
disp([' k1 = ' num2str(k1) ' k2 = ' num2str(k2)])
disp([' f1 = ' num2str(f1) ' f2 = ' num2str(f2)])
disp('%')
disp('%')
disp('% �������� � ��������� ����������� ������� fft_e1 � ��������� �������')
disp('%')
disp('%')
disp('% ��� ����������� ������� <ENTER>')
pause
disp('%')
disp('%')
%%
disp('% �.4. ��������� �������� ������� ��� ������� � ������� ��������� ��������� ��������� �������')
disp('%')
disp('%')
disp('% ��� ������ ��������� �������� ������ ��� ������� �������� ������� <ENTER>')
pause
noise = randn(1,N); % ���������� ����� ���
s = x+noise; % ���������� ����� ������� � �����
S = fft(s); % ��� ����� ������� � �����
MODS = (2/N)*abs(S); % ����������� ������ ����� ������� � �����
MODS(1) = (1/N)*abs(S(1));
NOISE = fft(noise); % ��� ����
MODNOISE = (2/N)*abs(NOISE); % ����������� ������ ����
MODNOISE(1) = (1/N)*abs(NOISE(1));
MAX_NOISE = max(MODNOISE); % �������� ������������ ������� ����
MAXS = max(MODS); % �������� ������������ ������� ����� ������� � �����
e1_low = MAX_NOISE/MAXS; % ������ ������� ������ ��� ������� ��������
e1_up = 1; % ������� ������� ������ ��� ������� ��������
P = (1/N)*sum(MODS.^2); % ������� �������� ����� ������� � �����
MAXS2 = MAXS.^2; % ������� ��������� ������������ ������� ����� ������� � �����
MAX_NOISE2 = MAX_NOISE.^2; % ������� ��������� ������������ ������� ����
disp('%')
disp('%')
disp([' e1_low = ' num2str(e1_low) ' e1_up = ' num2str(e1_up)])
disp('%')
disp('%')
disp('% ��� ������ ��������� �������� ������ ��� ������� �������� ������� <ENTER>')
pause
e2_low = MAX_NOISE2/P; % ������ ������� ������ ��� ������� ��������
e2_up = MAXS2/P; % ������� ������� ������ ��� ������� ��������
disp('%')
disp('%')
disp([' e2_low = ' num2str(e2_low) ' e2_up = ' num2str(e2_up)])
disp('%')
disp('%')
disp('% ��� ����������� ������� <ENTER>')
pause
disp('%')
disp('%')
%%
disp('% �.5. ��������� ��������� ������� �� ������� ��������')
disp('%')
disp('%')
disp('% ��� ������ ������� ���������� ����� ������� � ����� ������� <ENTER>')
pause
figure('Name','Mixture of Signal and Noise','NumberTitle', 'off')
stem(n,s,'MarkerSize',3,'Linewidth',2), grid
xlabel('n'), ylabel('s(n)')
title(strcat(['Mixture of Signal and Noise N = ',num2str(N)]))
disp('%')
disp('%')
disp('% ��� ������ �������� ������������ � �������������� ������������ ��������')
disp('% ���������� ����� ������� � ����� ������� <ENTER>')
pause
figure('Name','Amplitude Spectrum and Normalized Amplitude Spectrum','NumberTitle', 'off')
subplot(2,1,1), stem(k,MODS,'MarkerSize',3,'Linewidth',2), grid
xlabel('k'), ylabel('|S(k)|')
title(strcat(['Amplitude Spectrum N = ',num2str(N)]))
subplot(2,1,2), stem(k, MODS/MAXS,'MarkerSize',3,'Linewidth',2)
grid, xlabel('k'), ylabel('|S(k)|/max|S(k)|')
title(strcat(['Normalized Amplitude Spectrum N = ',num2str(N)]))
disp('%')
disp('%')
disp('% ������� ��������� �������� ������ e1 ��� ������� ��������')
disp('%')
e1 = input(' e1 = '); % ��������� �������� ������ ��� ������� ��������
disp('%')
disp('% ��� ������ �������� ���������� ������� fft_e1 ������� <ENTER>')
pause
[MODm,m] = fft_e1(MODS,e1) % ������� ������� ��� ��������� �������� � ������ �������� ��������� ������� �� ������� ��������
disp('%')
disp('%')
disp('% �������� �������� ���������� �� ������� �������� �������� � ������')
disp('% � ��������� �������')
disp('%')
disp('%')
disp('% ��� ����������� ������� <ENTER>')
pause
disp('%')
disp('%')
%%
disp('% �.6. ��������� ��������� ������� �� ������� ��������')
disp('%')
disp('%')
disp('% ��� ������ �������� ������������ ������� � �������� ������������')
disp('% �������, �������������� � �������� ������� ��������')
disp('% ���������� ����� ������� � �����, ������� <ENTER>')
pause
figure('Name','Amplitude Spectrum and Normalized Amplitude Spectrum Squire','NumberTitle', 'off')
subplot(2,1,1), stem(k,MODS,'MarkerSize',3,'Linewidth',2), grid
xlabel('k'), ylabel('|S(k)|')
title(strcat(['Amplitude Spectrum N = ',num2str(N)]))
subplot(2,1,2), stem(k,(MODS.^2)/P,'MarkerSize',3,'Linewidth',2)
grid, xlabel('k'), ylabel('|S(k)|^2/P')
title(strcat(['Normalized Amplitude Spectrum Squire N = ',num2str(N)]))
disp('%')
disp('%')
disp('% ������� ��������� �������� ������ e2 ��� ������� ��������')
disp('%')
e2 = input(' e2 = '); % ��������� �������� ������ ��� ������� ��������
disp('%')
disp('% ��� ������ �������� ���������� ������� fft_e2 ������� <ENTER> ')
pause
[MODm,m] = fft_e2(MODS,e2)% ������� ������� ��� ��������� �������� � ������ �������� ��������� ������� �� ������� ��������
disp('%')
disp('%')
disp('% �������� �������� ���������� �� ������� �������� �������� � ������')
disp('% � ��������� �������')
disp('%')
disp('%')
disp('% ��� ����������� ������� <ENTER>')
pause
disp('%')
disp('%')
%%
disp('% �.7. �������������� ����������� �������')
disp('%')
disp('%')
disp('% ��� ������ �������� ������������������ � ������ �� ���,')
disp('% ���������������� ����������� ������� � ��� �������')
disp('% � ��������� ����������� ������� ������� <ENTER>')
pause
Xa = [X(N/2+1:N),X(1:N/2)]; % ������ ����������� ������� (� ��������� �� ����������� ���������)
i = 1; % ������� �������� ����������� �������
for t = 0:0.25*T:(N-1)*T % �������� ������������ �������
    s = 0;
    for k = -N/2:N/2-1 % ���������� ������������� �������
        s = s + Xa(k+N/2+1)*exp(j*2*pi*k*t/(N*T)); % �������������� ����������� �������
    end
    xa(i) = (1/N).*s; % �������� ���������������� ����������� �������
    i = i+1;
end
t = 0:0.25*T:(N-1)*T;
xt = A1*cos(2*pi*f1*t+pi/4)+A2*cos(2*pi*f2*t+pi/8); % �������� ��������� ����������� �������
k = 0:N-1; % ���������� ������������� �������
MODa = (2/N)*abs(Xa); % ����������� ������ ���������������� ����������� �������
MODa(1) = (1/N)*abs(Xa(1));
figure('Name','Original Periodic Sequence & FFT, Reconstructed Analog Signal & Spectrum, Original Analog Signal','NumberTitle', 'off')
subplot(3,2,1), stem(n,x,'MarkerSize',3), grid
xlabel('n'), ylabel('x(n)')
title(strcat(['Original Periodic Sequence N = ',num2str(N)]))
subplot(3,2,2), stem(k,abs(X),'MarkerSize',3,'Linewidth',2), grid
xlabel('k'), ylabel('|X(k)|')
title(strcat(['DFT of Original Periodic Sequence N = ',num2str(N)]))
subplot(3,2,3), plot(t,real(xa)), grid, xlabel('t')
ylabel('x(t)'),title('Reconstructed Analog Signal')
k = -N/2:N/2-1;
subplot(3,2,4), stem(k,MODa,'MarkerSize',3,'Linewidth',2), grid
xlabel('k'), ylabel('|Xa(k)|')
title('Amplitude Spectrum of Reconstructed Analog Signal')
subplot(3,2,5), plot(t,xt), grid, xlabel('t')
ylabel('x(t)'), title('Original Analog Signal')
disp('%')
disp('%')
disp('% ��� ����������� ������� <ENTER>')
pause
disp('%')
disp('%')
%%
disp('% �.8. �������������� ������������ ��������� �������� ������������������')
disp('%')
disp('%')
disp('% ��� ������ �������� ��� � ������������ ��������� ��������')
disp('% ������������������, ����������� ����� ���������, ������� <ENTER>')
pause
L = 2*N; % ���������� �������� ������������ ��������� �� �������
l = 0;
for l = 0:(L-1) % ���������� ������������� �������
    S = 0;
    for n = 0:(N-1) % ���������� ������������� �����
        S = S + x(n+1)*exp(-1j*2*pi*l*n/L); % �������������� ������������ ���������
    end
    XW(l+1) = S; % �������� ��������������� ������������ ���������
    l = l+1;
end
xz = [x zeros(1,(L-N))]; % ������������������, ����������� ������ �� ����� L
XZ = fft(xz); % ��� ������������������, ����������� ������
k = 0:(N-1); % ���������� ������������� �������
w = 0:2*pi/L:2*pi-2*pi/L; % ������������� �������
l = 0:(L-1); % ���������� ������������� �������
figure('Name','DFT and Spectral Density','NumberTitle', 'off')
subplot(3,1,1), stem(k,abs(X),'MarkerSize',3,'Linewidth',2)
grid, xlabel('k'), ylabel('|X(k)')
title(strcat(['DFT Modulus N = ',num2str(N)]))
subplot(3,1,2), plot(w,abs(XW),'MarkerSize',3,'Linewidth',2)
grid, xlabel('w'), ylabel('|X(w)|')
title(strcat(['Spectral Density Modulus (option 1) L = ',num2str(L)]))
subplot(3,1,3), plot(w,abs(XZ),'MarkerSize',3,'Linewidth',2)
grid, xlabel('w'), ylabel('|X(w)|')
title(strcat(['Spectral Density Modulus (option 2) L = ',num2str(L)]))
disp('%')
disp('%')
disp('% ��� ����������� ������� <ENTER>')
pause
disp('%')
disp('%')
%%
disp('% �.9. ���������� ������� ������������� �� ������� ��� ���������� ���')
disp('%')
disp('%')
disp('% ��� ������ �������� �������� �������������������,')
disp('% ��� � ������������ ���������� ������� <ENTER>')
pause
figure('Name','Finite Sequences, DFT and Spectral Densities','NumberTitle','off')
L = [N 2*N 4*N];
for i = 1:length(L)
    xz = [x zeros(1,(L(i)-N))]; % ������������������, ����������� ������ �� ����� L(i)
    XZ = fft(xz);
    Delta_f(i) = Fs/L(i);
    n = 0:length(xz)-1; % ���������� ������������� �����
    k = 0:length(XZ)-1; % ���������� ������������� �������
    subplot(3,2,2*i-1), stem(n,xz,'MarkerSize',3), xlabel('n'), grid
    title(strcat(['Finite Sequence x(n) L = ',num2str(L(i))]))
    subplot(3,2,2*i), plot(k,abs(XZ), 'r','MarkerSize',3, 'Linewidth',2), grid,
    hold on, stem(k,abs(XZ),':'), xlabel('k')
    title(strcat(['DFT and Spectral Density Modulus L = ',num2str(L(i))]))
end
disp('%')
disp('%')
disp('% ��� ������ �������� ��� � �������� ������������� �� ������� ������� <ENTER>')
pause
disp('%')
disp([' L = [',num2str(L) ']'])
disp('%')
disp([' Delta_f = [',num2str(Delta_f) ']'])
disp('%')
disp('%')
disp('% ������ ���������')