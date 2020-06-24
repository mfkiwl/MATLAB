Fs = 2000;
N = 64; % ΣΟΗΜΑΣΞΟ ΧΑÒΙΑΞΤΥ
T = 1/Fs;
t = -500*(N-1)*T:500*(N-1)*T;
s = size(t);
x = zeros(1, s(2));
for i = 1:s(2)
    x(i) = sin(pi*t(i))/(pi*t(i));
end
k = -s(2)/2:s(2)/2-1;
MOD_K = abs(fft(x)); % νοδυμψ δπζ λοξεώξοκ ποσμεδοχατεμψξοστι
figure('Name','DFT Modulus and Amplitude Spectrum', 'NumberTitle','off')
subplot(2,1,1), stem(t,x, 'MarkerSize',3,'Linewidth',2)
grid, xlabel('t')
ylabel('x(n)'), title('Periodic Sequence x(n)')
subplot(2,1,2), stem(k,MOD_K,'MarkerSize',3,'Linewidth',2), grid
xlabel('k'), ylabel('|X(k)|')
title('DFT Modulus of the Finite Sequence')


