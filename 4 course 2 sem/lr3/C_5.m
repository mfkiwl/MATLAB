%%
C = 1;
w0 = pi/2;
omega = w0/4;
phi_omega = 0;
m = 0.5;
N = 64; % ΣΟΗΜΑΣΞΟ ΧΑÒΙΑΞΤΥ
N = 2*N;
%%
n = 0:(N-1); % δισλςετξοε ξοςνιςοχαξξοε χςενρ
k = 0:(N-1); % δισλςετξαρ ξοςνιςοχαξξαρ ώαστοτα
x = zeros(1, N);
for i = 1:N
    x(i) = C*(1+m*cos(omega*i+phi_omega))*cos(w0*i);
end
MOD_K = abs(fft(x)); % νοδυμψ δπζ λοξεώξοκ ποσμεδοχατεμψξοστι
figure('Name','DFT Modulus and Amplitude Spectrum', 'NumberTitle','off')
subplot(2,1,1), stem(n,x, 'MarkerSize',3,'Linewidth',2)
grid, xlabel('n')
ylabel('x(n)'), title(strcat(['Periodic Sequence x(n) N = ',num2str(N)]))
subplot(2,1,2), stem(k,MOD_K,'MarkerSize',3,'Linewidth',2), grid
xlabel('k'), ylabel('|X(k)|')
title('DFT Modulus of the Finite Sequence')

