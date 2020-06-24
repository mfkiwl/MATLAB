all_figs = findobj(0, 'type', 'figure'); % ΕΣΜΙ ΞΑΔΟ ΪΑΛÒΩΤΨ ΝΞΟΗΟ ΖΙΗΥÒ
delete(all_figs)
clc
clear
%%
    Nb = 4; % ξονες βςιηαδω
    N = 64; % δμιξα (πεςιοδ) ποσμεδοχατεμψξοστι
    Fs = 2000*(mod(Nb, 5) + 1); % ώαστοτα δισλςετιϊαγιι
    T = 1/Fs; % πεςιοδ δισλςετιϊαγιι 1/Fs
    A1 = 1+0.01*Nb; % ανπμιτυδω δισλςετξωθ ηαςνοξιλ
    A2 = 2*A1;
    f1 = Fs/8; % ώαστοτω (ηΓ) δισλςετξωθ ηαςνοξιλ
    f2 = Fs/12;

%%    
n = 0:(N-1); % δισλςετξοε ξοςνιςοχαξξοε χςενρ
k = 0:(N-1); % δισλςετξαρ ξοςνιςοχαξξαρ ώαστοτα
w1 = 2*pi*f1/Fs; w2 = 2*pi*f2/Fs; 
x1 = zeros(1, N);
for i = 1:N
    if i < N/2
        x1(i) = A1*cos(w1*i); % πεςιοδιώεσλαρ ποσμεδοχατεμψξοστψ 
    else
        x1(i) = A2*cos(w2*(i - N/2));
    end
end
MOD_K = abs(fft(x1)); % νοδυμψ δπζ λοξεώξοκ ποσμεδοχατεμψξοστι
figure('Name','DFT Modulus and Amplitude Spectrum', 'NumberTitle','off')
subplot(2,1,1), stem(n,x1, 'MarkerSize',3,'Linewidth',2)
grid, xlabel('n')
ylabel('x(n)'), title(strcat(['Periodic Sequence x1(n) N = ',num2str(N)]))
subplot(2,1,2), stem(k,MOD_K,'MarkerSize',3,'Linewidth',2), grid
xlabel('k'), ylabel('|X1(k)|')
title('DFT Modulus of the Finite Sequence')


x = A1*cos(w1*n+pi/4)+A2*cos(w2*n+pi/8); % πεςιοδιώεσλαρ ποσμεδοχατεμψξοστψ
MOD_K = abs(fft(x)); % νοδυμψ δπζ λοξεώξοκ ποσμεδοχατεμψξοστι
figure('Name','DFT Modulus and Amplitude Spectrum', 'NumberTitle','off')
subplot(2,1,1), stem(n,x, 'MarkerSize',3,'Linewidth',2)
grid, xlabel('n')
ylabel('x(n)'), title(strcat(['Periodic Sequence x(n) N = ',num2str(N)]))
subplot(2,1,2), stem(k,MOD_K,'MarkerSize',3,'Linewidth',2), grid
xlabel('k'), ylabel('|X(k)|')
title('DFT Modulus of the Finite Sequence');