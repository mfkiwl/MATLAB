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
N = N/2;
n = 0:(N-1); % δισλςετξοε ξοςνιςοχαξξοε χςενρ
k = 0:(N-1); % δισλςετξαρ ξοςνιςοχαξξαρ ώαστοτα
w1 = 2*pi*f1/Fs; w2 = 2*pi*f2/Fs; 
x = A1*cos(w1*n+pi/4)+A2*cos(w2*n+pi/8); % πεςιοδιώεσλαρ ποσμεδοχατεμψξοστψ    
MOD_K = abs(fft(x)); % νοδυμψ δπζ λοξεώξοκ ποσμεδοχατεμψξοστι
PHASE = angle(fft(x));
figure('Name','DFT Modulus and Amplitude Spectrum', 'NumberTitle','off')
stem(k,MOD_K,'MarkerSize',3,'Linewidth',2), grid
xlabel('k'), ylabel('|X(k)|')
title('DFT Modulus of the Finite Sequence')

figure('Name','Phase Spectrum','NumberTitle', 'off')
stem(k, PHASE,'MarkerSize',3,'Linewidth',2), grid
xlabel('k'), ylabel('arg{X(k)} (rad)')
title(strcat(['Phase Spectrum of the Periodic Sequence N = ',num2str(N)]))