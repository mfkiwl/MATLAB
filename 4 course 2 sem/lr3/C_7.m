a = 0.0005;
w1 = pi/12;
N = 64; % ΣΟΗΜΑΣΞΟ ΧΑÒΙΑΞΤΥ
n = -3*(N-1):3*(N-1);
x = zeros(1, length(n));
for i = 1:length(n)
    x(i) = exp(-a*n(i)^2)*cos(w1*n(i));
end
k = -length(n)/2:length(n)/2-1;
MOD_K = abs(fft(x)); % νοδυμψ δπζ λοξεώξοκ ποσμεδοχατεμψξοστι
figure('Name','DFT Modulus and Amplitude Spectrum', 'NumberTitle','off')
subplot(2,1,1), stem(n,x, 'MarkerSize',3,'Linewidth',2)
grid, xlabel('t')
ylabel('x(n)'), title('Periodic Sequence x(n)')
subplot(2,1,2), stem(k,MOD_K,'MarkerSize',3,'Linewidth',2), grid
xlabel('k'), ylabel('|X(k)|')
title('DFT Modulus of the Finite Sequence')

    