% all_figs = findobj(0, 'type', 'figure'); -- ΕΣΜΙ ΞΑΔΟ ΪΑΛÒΩΤΨ ΝΞΟΗΟ ΖΙΗΥÒ
% delete(all_figs)
clc
clear
disp('% μς ?9. δισλςετξοε πςεοβςαϊοχαξιε ζυςψε (ήΑΣΤΨ 1)')
% disp('%')
% disp('%')
% disp('% χΧΕΔΙΤΕ ισθοδξωε δαξξωε');
    Nb = 4; % ξονες βςιηαδω
    N = 64; % δμιξα (πεςιοδ) ποσμεδοχατεμψξοστι
    Fs = 2000*(mod(Nb, 5) + 1); % ώαστοτα δισλςετιϊαγιι
    T = 1/Fs; % πεςιοδ δισλςετιϊαγιι 1/Fs
    A1 = 1+0.01*Nb; % ανπμιτυδω δισλςετξωθ ηαςνοξιλ
    A2 = 2*A1;
    f1 = Fs/8; % ώαστοτω (ηΓ) δισλςετξωθ ηαςνοξιλ
    f2 = Fs/12;
% DATA=0;
% while DATA==0
%     Nb = input('Nb = '); % ξονες βςιηαδω
%     N = input('N = '); % δμιξα (πεςιοδ) ποσμεδοχατεμψξοστι
%     Fs = input('Fs = '); % ώαστοτα δισλςετιϊαγιι
%     T = input('T = '); % πεςιοδ δισλςετιϊαγιι 1/Fs
%     A1 = input('A1 = '); % ανπμιτυδω δισλςετξωθ ηαςνοξιλ
%     A2 = input('A2 = ');
%     f1 = input('f1 = '); % ώαστοτω (ηΓ) δισλςετξωθ ηαςνοξιλ
%     f2 = input('f2 = ');
%     disp('% πÒΟΧΕÒΨΤΕ πςαχιμψξοστψ ΧΧΟΔΑ ισθοδξωθ δαξξωθ')
%     disp('% πÒΙ πςαχιμψξωθ ισθοδξωθ δαξξωθ ΧΧΕΔΙΤΕ 1')
%     disp('% πÒΙ ξεπςαχιμψξωθ ισθοδξωθ δαξξωθ ΧΧΕΔΙΤΕ 0 Ι ποχτοςιτε ΧΧΟΔ')
%     DATA = input('--> ');
% end
disp('%')
disp('% δΜΡ ΧΩΧΟΔΑ ισθοδξωθ ανπμιτυδ Ι ώαστοτ δισλςετξωθ ηαςνοξιλ ΞΑΦΝΙΤΕ<ENTER>')
pause
disp('%')
disp([' A1 = ' num2str(A1) ' A2 = ' num2str(A2)])
disp([' f1 = ' num2str(f1) ' f2 = ' num2str(f2)])
disp('%')
disp('%')
disp('% δΜΡ ΠÒΟΔΟΜΦΕΞΙΡ ΞΑΦΝΙΤΕ <ENTER>')
pause
disp('%')
disp('%')
%%
disp('% Π.1. χωώισμεξιε ανπμιτυδξοηο ι ζαϊοχοηο σπελτςοχ πεςιοδιώεσλοκ ποσμεδοχατεμψξοστι')
disp('%')
disp('%')
disp('% δΜΡ ΧΩΧΟΔΑ ηςαζιλοχ ΠΕÒΙΟΔΙήΕΣΛΟΚ ΠΟΣΜΕΔΟΧΑΤΕΜΨΞΟΣΤΙ ΞΑΦΝΙΤΕ <ENTER>')
pause
n = 0:(N-1); % δισλςετξοε ξοςνιςοχαξξοε χςενρ
k = 0:(N-1); % δισλςετξαρ ξοςνιςοχαξξαρ ώαστοτα
w1 = 2*pi*f1/Fs; w2 = 2*pi*f2/Fs; % ξοςνιςοχαξξωε ώαστοτω δισλςετξωθ ηαςνοξιλ (ςαδ)
x = A1*cos(w1*n+pi/4)+A2*cos(w2*n+pi/8); % πεςιοδιώεσλαρ ποσμεδοχατεμψξοστψ
X = fft(x); % δπζ πεςιοδιώεσλοκ ποσμεδοχατεμψξοστι
MOD = (2/N)*abs(X); % ανπμιτυδξωκ σπελτς πεςιοδιώεσλοκ ποσμεδοχατεμψξοστι
MOD(1) = (1/N)*abs(X(1));
PHASE = angle(X); % ζαϊοχωκ σπελτς πεςιοδιώεσλοκ ποσμεδοχατεμψξοστι
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
x = ifft(X); % πεςιοδιώεσλαρ ποσμεδοχατεμψξοστψ,χωώισμεξξαρ σ πονούψΰ οδπζ
subplot(3,1,3), stem(n,x,'MarkerSize',3,'Linewidth',2)
grid, xlabel('n')
ylabel('x(n)'), title(strcat(['Periodic Sequence x = ifft(X) N =',num2str(N)]))
disp('%')
disp('%')
disp('% δΜΡ ΧΩΧΟΔΑ ηςαζιλοχ ανπμιτυδξοηο σπελτςα ΠΕÒΙΟΔΙήΕΣΛΟΚ ΠΟΣΜΕΔΟΧΑΤΕΜΨΞΟΣΤΙ ΞΑΦΝΙΤΕ <ENTER>')
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
disp('% δΜΡ ΧΩΧΟΔΑ ηςαζιλοχ ζαϊοχοηο σπελτςα ΠΕÒΙΟΔΙήΕΣΛΟΚ ΠΟΣΜΕΔΟΧΑΤΕΜΨΞΟΣΤΙ ΞΑΦΝΙΤΕ <ENTER>')
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
disp('% δΜΡ ΠÒΟΔΟΜΦΕΞΙΡ ΞΑΦΝΙΤΕ <ENTER>')
pause
disp('%')
disp('%')
%%
disp('% Π.2. χωώισμεξιε δπζ λοξεώξοκ ποσμεδοχατεμψξοστι')
disp('%')
disp('%')
disp('% δΜΡ ΧΩΧΟΔΑ ηςαζιλοχ νοδυμρ δπζ ΛΟΞΕήΞΟΚ ΠΟΣΜΕΔΟΧΑΤΕΜΨΞΟΣΤΙ Ι ανπμιτυδξοηο σπελτςα')
disp('% ΠΕÒΙΟΔΙήΕΣΛΟΚ ΠΟΣΜΕΔΟΧΑΤΕΜΨΞΟΣΤΙ ΞΑΦΝΙΤΕ <ENTER>')
pause
MOD_K = abs(fft(x)); % νοδυμψ δπζ λοξεώξοκ ποσμεδοχατεμψξοστι
figure('Name','DFT Modulus and Amplitude Spectrum', 'NumberTitle','off')
subplot(2,1,1), stem(k,MOD_K,'MarkerSize',3,'Linewidth',2), grid
xlabel('k'), ylabel('|X(k)|')
title('DFT Modulus of the Finite Sequence')
subplot(2,1,2), stem(k,MOD,'MarkerSize',3,'Linewidth',2), grid
xlabel('k'), ylabel('1/N |X(k)|')
title('Amplitude Spectrum of the Periodic Sequence')
disp('%')
disp('%')
disp('% δΜΡ ΠÒΟΔΟΜΦΕΞΙΡ ΞΑΦΝΙΤΕ <ENTER>')
pause
disp('%')
disp('%')
%%
disp('% Π.3. οπςεδεμεξιε ανπμιτυδ ι ώαστοτ δισλςετξωθ ηαςνοξιλ')
disp('%')
disp('%')
disp('% δΜΡ ΧΩΧΟΔΑ χωθοδξωθ παςανετςοχ ζυξλγιι fft_e1 ΞΑΦΝΙΤΕ <ENTER>')
pause
e1 = 1e-7; % ϊξαώεξιε ποςοηα δμρ πεςχοηο λςιτεςιρ
[MODm,m] = fft_e1(MOD,e1); % χξεϋξρρ ζυξλγιρ δμρ χωδεμεξιρ ανπμιτυδ ι ώαστοτ ηαςνοξιλ πομεϊξοηο σιηξαμα πο πεςχονυ λςιτεςιΰ
disp('%')
disp('%')
disp('% δΜΡ ΧΩΧΟΔΑ ανπμιτυδ Ι ώαστοτ δισλςετξωθ ηαςνοξιλ ΞΑΦΝΙΤΕ <ENTER>')
pause
A1 = MODm(1); A2 = MODm(2); % ανπμιτυδω δισλςετξωθ ηαςνοξιλ
k1 = m(1); k2 = m(2); % δισλςετξωε ξοςνιςοχαξξωε ώαστοτω
f1 = k1*Fs/N; f2 = k2*Fs/N; % ώαστοτω (ηΓ) δισλςετξωθ ηαςνοξιλ
disp('%')
disp('%')
disp([' A1 = ' num2str(A1) ' A2 = ' num2str(A2)])
disp([' k1 = ' num2str(k1) ' k2 = ' num2str(k2)])
disp([' f1 = ' num2str(f1) ' f2 = ' num2str(f2)])
disp('%')
disp('%')
disp('% σςαχξιτε Σ χωθοδξωνι παςανετςανι ΖΥΞΛΓΙΙ fft_e1 Ι ΙΣΘΟΔΞΩΝΙ ΔΑΞΞΩΝΙ')
disp('%')
disp('%')
disp('% δΜΡ ΠÒΟΔΟΜΦΕΞΙΡ ΞΑΦΝΙΤΕ <ENTER>')
pause
disp('%')
disp('%')
%%
disp('% Π.4. ηςαξιώξωε ϊξαώεξιρ ποςοηοχ δμρ πεςχοηο ι χτοςοηο λςιτεςιεχ χωδεμεξιρ πομεϊξοηο σιηξαμα')
disp('%')
disp('%')
disp('% δΜΡ ΧΩΧΟΔΑ ΗÒΑΞΙήΞΩΘ ΪΞΑήΕΞΙΚ ΠΟÒΟΗΑ ΔΜΡ πεςχοηο λςιτεςιρ ΞΑΦΝΙΤΕ <ENTER>')
pause
noise = randn(1,N); % ξοςναμψξωκ βεμωκ ϋυν
s = x+noise; % αδδιτιχξαρ σνεσψ σιηξαμα σ ϋυνον
S = fft(s); % δπζ σνεσι σιηξαμα σ ϋυνον
MODS = (2/N)*abs(S); % ανπμιτυδξωκ σπελτς σνεσι σιηξαμα σ ϋυνον
MODS(1) = (1/N)*abs(S(1));
NOISE = fft(noise); % δπζ ϋυνα
MODNOISE = (2/N)*abs(NOISE); % ανπμιτυδξωκ σπελτς ϋυνα
MODNOISE(1) = (1/N)*abs(NOISE(1));
MAX_NOISE = max(MODNOISE); % ναλσινυν ανπμιτυδξοηο σπελτςα ϋυνα
MAXS = max(MODS); % ναλσινυν ανπμιτυδξοηο σπελτςα σνεσι σιηξαμα σ ϋυνον
e1_low = MAX_NOISE/MAXS; % ξιφξρρ ηςαξιγα ποςοηα δμρ πεςχοηο λςιτεςιρ
e1_up = 1; % χεςθξρρ ηςαξιγα ποςοηα δμρ πεςχοηο λςιτεςιρ
P = (1/N)*sum(MODS.^2); % σςεδξρρ νούξοστψ σνεσι σιηξαμα σ ϋυνον
MAXS2 = MAXS.^2; % λχαδςατ ναλσινυνα ανπμιτυδξοηο σπελτςα σνεσι σιηξαμα σ ϋυνον
MAX_NOISE2 = MAX_NOISE.^2; % λχαδςατ ναλσινυνα ανπμιτυδξοηο σπελτςα ϋυνα
disp('%')
disp('%')
disp([' e1_low = ' num2str(e1_low) ' e1_up = ' num2str(e1_up)])
disp('%')
disp('%')
disp('% δΜΡ ΧΩΧΟΔΑ ΗÒΑΞΙήΞΩΘ ΪΞΑήΕΞΙΚ ΠΟÒΟΗΑ ΔΜΡ χτοςοηο λςιτεςιρ ΞΑΦΝΙΤΕ <ENTER>')
pause
e2_low = MAX_NOISE2/P; % ξιφξρρ ηςαξιγα ποςοηα δμρ χτοςοηο λςιτεςιρ
e2_up = MAXS2/P; % χεςθξρρ ηςαξιγα ποςοηα δμρ χτοςοηο λςιτεςιρ
disp('%')
disp('%')
disp([' e2_low = ' num2str(e2_low) ' e2_up = ' num2str(e2_up)])
disp('%')
disp('%')
disp('% δΜΡ ΠÒΟΔΟΜΦΕΞΙΡ ΞΑΦΝΙΤΕ <ENTER>')
pause
disp('%')
disp('%')
%%
disp('% Π.5. χωδεμεξιε πομεϊξοηο σιηξαμα πο πεςχονυ λςιτεςιΰ')
disp('%')
disp('%')
disp('% δΜΡ ΧΩΧΟΔΑ ηςαζιλα ΑΔΔΙΤΙΧΞΟΚ ΣΝΕΣΙ ΣΙΗΞΑΜΑ Σ ΫΥΝΟΝ ΞΑΦΝΙΤΕ <ENTER>')
pause
figure('Name','Mixture of Signal and Noise','NumberTitle', 'off')
stem(n,s,'MarkerSize',3,'Linewidth',2), grid
xlabel('n'), ylabel('s(n)')
title(strcat(['Mixture of Signal and Noise N = ',num2str(N)]))
disp('%')
disp('%')
disp('% δΜΡ ΧΩΧΟΔΑ ηςαζιλοχ ΑΝΠΜΙΤΥΔΞΟΗΟ Ι ξοςνιςοχαξξοηο ΑΝΠΜΙΤΥΔΞΟΗΟ ΣΠΕΛΤÒΟΧ')
disp('% ΑΔΔΙΤΙΧΞΟΚ ΣΝΕΣΙ ΣΙΗΞΑΜΑ Σ ΫΥΝΟΝ ΞΑΦΝΙΤΕ <ENTER>')
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
disp('% χΧΕΔΙΤΕ ΧΩΒÒΑΞΞΟΕ ΪΞΑήΕΞΙΕ ΠΟÒΟΗΑ e1 ΔΜΡ πεςχοηο λςιτεςιρ')
disp('%')
e1 = input(' e1 = '); % χωβςαξξοε ϊξαώεξιε ποςοηα δμρ πεςχοηο λςιτεςιρ
disp('%')
disp('% δΜΡ ΧΩΧΟΔΑ χωθοδξωθ παςανετςοχ ζυξλγιι fft_e1 ΞΑΦΝΙΤΕ <ENTER>')
pause
[MODm,m] = fft_e1(MODS,e1) % χξεϋξρρ ζυξλγιρ δμρ χωδεμεξιρ ανπμιτυδ ι ώαστοτ ηαςνοξιλ πομεϊξοηο σιηξαμα πο πεςχονυ λςιτεςιΰ
disp('%')
disp('%')
disp('% σςαχξιτε ΪΞΑήΕΞΙΡ χωδεμεξξωθ πο πεςχονυ λςιτεςιΰ ανπμιτυδ ι ώαστοτ')
disp('% Σ ΙΣΘΟΔΞΩΝΙ ΔΑΞΞΩΝΙ')
disp('%')
disp('%')
disp('% δΜΡ ΠÒΟΔΟΜΦΕΞΙΡ ΞΑΦΝΙΤΕ <ENTER>')
pause
disp('%')
disp('%')
%%
disp('% Π.6. χωδεμεξιε πομεϊξοηο σιηξαμα πο χτοςονυ λςιτεςιΰ')
disp('%')
disp('%')
disp('% δΜΡ ΧΩΧΟΔΑ ηςαζιλοχ ΑΝΠΜΙΤΥΔΞΟΗΟ ΣΠΕΛΤÒΑ Ι λχαδςατα ΑΝΠΜΙΤΥΔΞΟΗΟ')
disp('% ΣΠΕΛΤÒΑ, ξοςνιςοχαξξοηο Λ ΧΕΜΙήΙΞΕ ΣÒΕΔΞΕΚ ΝΟέΞΟΣΤΙ')
disp('% ΑΔΔΙΤΙΧΞΟΚ ΣΝΕΣΙ ΣΙΗΞΑΜΑ Σ ΫΥΝΟΝ, ΞΑΦΝΙΤΕ <ENTER>')
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
disp('% χΧΕΔΙΤΕ ΧΩΒÒΑΞΞΟΕ ΪΞΑήΕΞΙΕ ΠΟÒΟΗΑ e2 ΔΜΡ χτοςοηο λςιτεςιρ')
disp('%')
e2 = input(' e2 = '); % χωβςαξξοε ϊξαώεξιε ποςοηα δμρ χτοςοηο λςιτεςιρ
disp('%')
disp('% δΜΡ ΧΩΧΟΔΑ χωθοδξωθ παςανετςοχ ζυξλγιι fft_e2 ΞΑΦΝΙΤΕ <ENTER> ')
pause
[MODm,m] = fft_e2(MODS,e2)% χξεϋξρρ ζυξλγιρ δμρ χωδεμεξιρ ανπμιτυδ ι ώαστοτ ηαςνοξιλ πομεϊξοηο σιηξαμα πο χτοςονυ λςιτεςιΰ
disp('%')
disp('%')
disp('% σςαχξιτε ΪΞΑήΕΞΙΡ χωδεμεξξωθ πο χτοςονυ λςιτεςιΰ ανπμιτυδ ι ώαστοτ')
disp('% Σ ΙΣΘΟΔΞΩΝΙ ΔΑΞΞΩΝΙ')
disp('%')
disp('%')
disp('% δΜΡ ΠÒΟΔΟΜΦΕΞΙΡ ΞΑΦΝΙΤΕ <ENTER>')
pause
disp('%')
disp('%')
%%
disp('% Π.7. χοσσταξοχμεξιε αξαμοηοχοηο σιηξαμα')
disp('%')
disp('%')
disp('% δΜΡ ΧΩΧΟΔΑ ηςαζιλοχ ποσμεδοχατεμψξοστι Ι νοδυμρ ΕΕ δπζ,')
disp('% χοσσταξοχμεξξοηο αξαμοηοχοηο σιηξαμα Ι ΕΗΟ σπελτςα')
disp('% Ι ισθοδξοηο αξαμοηοχοηο σιηξαμα ΞΑΦΝΙΤΕ <ENTER>')
pause
Xa = [X(N/2+1:N),X(1:N/2)]; % σπελτς αξαμοηοχοηο σιηξαμα (σ τοώξοστψΰ δο ποστορξξοηο νξοφιτεμρ)
i = 1; % σώετώιλ ϊξαώεξικ αξαμοηοχοηο σιηξαμα
for t = 0:0.25*T:(N-1)*T % ϊξαώεξιρ ξεπςεςωχξοηο χςενεξι
    s = 0;
    for k = -N/2:N/2-1 % δισλςετξαρ ξοςνιςοχαξξαρ ώαστοτα
        s = s + Xa(k+N/2+1)*exp(j*2*pi*k*t/(N*T)); % χοσσταξοχμεξιε αξαμοηοχοηο σιηξαμα
    end
    xa(i) = (1/N).*s; % ϊξαώεξιρ χοσσταξοχμεξξοηο αξαμοηοχοηο σιηξαμα
    i = i+1;
end
t = 0:0.25*T:(N-1)*T;
xt = A1*cos(2*pi*f1*t+pi/4)+A2*cos(2*pi*f2*t+pi/8); % ϊξαώεξιρ ισθοδξοηο αξαμοηοχοηο σιηξαμα
k = 0:N-1; % δισλςετξαρ ξοςνιςοχαξξαρ ώαστοτα
MODa = (2/N)*abs(Xa); % ανπμιτυδξωκ σπελτς χοσσταξοχμεξξοηο αξαμοηοχοηο σιηξαμα
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
disp('% δΜΡ ΠÒΟΔΟΜΦΕΞΙΡ ΞΑΦΝΙΤΕ <ENTER>')
pause
disp('%')
disp('%')
%%
disp('% Π.8. χοσσταξοχμεξιε σπελτςαμψξοκ πμοτξοστι λοξεώξοκ ποσμεδοχατεμψξοστι')
disp('%')
disp('%')
disp('% δΜΡ ΧΩΧΟΔΑ ηςαζιλοχ δπζ Ι σπελτςαμψξοκ πμοτξοστι ΛΟΞΕήΞΟΚ')
disp('% ΠΟΣΜΕΔΟΧΑΤΕΜΨΞΟΣΤΙ, ΧΩήΙΣΜΕΞΞΟΚ δχυνρ ΣΠΟΣΟΒΑΝΙ, ΞΑΦΝΙΤΕ <ENTER>')
pause
L = 2*N; % λομιώεστχο οτσώετοχ σπελτςαμψξοκ πμοτξοστι ξα πεςιοδε
l = 0;
for l = 0:(L-1) % δισλςετξαρ ξοςνιςοχαξξαρ ώαστοτα
    S = 0;
    for n = 0:(N-1) % δισλςετξοε ξοςνιςοχαξξοε χςενρ
        S = S + x(n+1)*exp(-1j*2*pi*l*n/L); % χοσσταξοχμεξιε σπελτςαμψξοκ πμοτξοστι
    end
    XW(l+1) = S; % ϊξαώεξιρ χοσσταξοχμεξξοκ σπελτςαμψξοκ πμοτξοστι
    l = l+1;
end
xz = [x zeros(1,(L-N))]; % ποσμεδοχατεμψξοστψ, δοπομξεξξαρ ξυμρνι δο δμιξω L
XZ = fft(xz); % δπζ ποσμεδοχατεμψξοστι, δοπομξεξξοκ ξυμρνι
k = 0:(N-1); % δισλςετξαρ ξοςνιςοχαξξαρ ώαστοτα
w = 0:2*pi/L:2*pi-2*pi/L; % ξοςνιςοχαξξαρ ώαστοτα
l = 0:(L-1); % δισλςετξαρ ξοςνιςοχαξξαρ ώαστοτα
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
disp('% δΜΡ ΠÒΟΔΟΜΦΕΞΙΡ ΞΑΦΝΙΤΕ <ENTER>')
pause
disp('%')
disp('%')
%%
disp('% Π.9. υνεξψϋεξιε πεςιοδα δισλςετιϊαγιι πο ώαστοτε πςι χωώισμεξιι δπζ')
disp('%')
disp('%')
disp('% δΜΡ ΧΩΧΟΔΑ ηςαζιλοχ λοξεώξωθ ποσμεδοχατεμψξοστεκ,')
disp('% δπζ Ι σπελτςαμψξωθ πμοτξοστεκ ΞΑΦΝΙΤΕ <ENTER>')
pause
figure('Name','Finite Sequences, DFT and Spectral Densities','NumberTitle','off')
L = [N 2*N 4*N];
for i = 1:length(L)
    xz = [x zeros(1,(L(i)-N))]; % ποσμεδοχατεμψξοστψ, δοπομξεξξαρ ξυμρνι δο δμιξω L(i)
    XZ = fft(xz);
    Delta_f(i) = Fs/L(i);
    n = 0:length(xz)-1; % δισλςετξοε ξοςνιςοχαξξοε χςενρ
    k = 0:length(XZ)-1; % δισλςετξαρ ξοςνιςοχαξξαρ ώαστοτα
    subplot(3,2,2*i-1), stem(n,xz,'MarkerSize',3), xlabel('n'), grid
    title(strcat(['Finite Sequence x(n) L = ',num2str(L(i))]))
    subplot(3,2,2*i), plot(k,abs(XZ), 'r','MarkerSize',3, 'Linewidth',2), grid,
    hold on, stem(k,abs(XZ),':'), xlabel('k')
    title(strcat(['DFT and Spectral Density Modulus L = ',num2str(L(i))]))
end
disp('%')
disp('%')
disp('% δΜΡ ΧΩΧΟΔΑ πεςιοδοχ δπζ Ι πεςιοδοχ δισλςετιϊαγιι πο ώαστοτε ΞΑΦΝΙΤΕ <ENTER>')
pause
disp('%')
disp([' L = [',num2str(L) ']'])
disp('%')
disp([' Delta_f = [',num2str(Delta_f) ']'])
disp('%')
disp('%')
disp('% ςαβοτα ϊαχεςϋεξα')