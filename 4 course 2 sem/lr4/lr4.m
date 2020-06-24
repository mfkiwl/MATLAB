script
clc
clear
disp('% μς ?10. δισλςετξοε πςεοβςαϊοχαξιε ζυςψε (ήΑΣΤΨ 2)')
Nb = 4; % ξονες βςιηαδω (ΧΩΒÒΑΤΨ ΠΟ ΧΑÒΙΑΞΤΥ)
N = 64; % δμιξα (πεςιοδ) ποσμεδοχατεμψξοστι
Fs = 2000*mod(Nb, 5) + 1; % ώαστοτα δισλςετιϊαγιι (ηΓ)
A1 = 1 + 0.01*Nb; % ανπμιτυδω δισλςετξωθ ηαςνοξιλ
A2 = 2*A1;
f1 = Fs/4; % ώαστοτω δισλςετξωθ ηαςνοξιλ (ηΓ)
f2 = 1.5*f1;
disp('%')
disp('% Π.1. πςοχεςλα ςαχεξστχα παςσεχαμρ')
n = 0:(N-1); % δισλςετξοε ξοςνιςοχαξξοε χςενρ
k = 0:(N-1); % δισλςετξαρ ξοςνιςοχαξξαρ ώαστοτα
w1 = 2*pi*f1/Fs; w2 = 2*pi*f2/Fs; % ξοςνιςοχαξξωε ώαστοτω δισλςετξωθ ηαςνοξιλ(ςαδ)
x = A1*cos(w1*n)+A2*cos(w2*n); % ποσμεδοχατεμψξοστψ(πεςιοδ N)
X = fft(x); % δπζ ποσμεδοχατεμψξοστι
E1 = sum(x.^2); % όξεςηιρ ποσμεδοχατεμψξοστι, χωώισμεξξαρ πο εε οτσώεταν
E2 = (1/N)*sum(abs(X).^2); % όξεςηιρ ποσμεδοχατεμψξοστι, χωώισμεξξαρ πο οτσώεταν δπζ
disp('%')
disp('% δΜΡ ΧΩΧΟΔΑ ΜΕΧΟΚ (E1) Ι ΠÒΑΧΟΚ (E2) ήΑΣΤΕΚ ςαχεξστχα παςσεχαμρ ΞΑΦΝΙΤΕ <ENTER>')
pause
disp('%')
disp([' E1 = ',num2str(E1),' E2 = ' num2str(E2)])
disp('%')
disp('% δΜΡ ΠÒΟΔΟΜΦΕΞΙΡ ΞΑΦΝΙΤΕ <ENTER>')
pause
disp('%')

disp('% Π.2. ισσμεδοχαξιε όζζελτα ςαστελαξιρ σπελτςα δμρ οδξοκ δισλςετξοκ ηαςνοξιλι')
M = 71; % πεςιοδ ποσμεδοχατεμψξοστι M
n = 0:(N-1); % δισλςετξοε ξοςνιςοχαξξοε χςενρ (πεςιοδ N)
k = 0:(N-1); % δισλςετξαρ ξοςνιςοχαξξαρ ώαστοτα (πεςιοδ N)
w1 = 2*pi*f1/Fs; % ξοςνιςοχαξξαρ ώαστοτα (ςαδ)
x_N = A1*cos(w1*n); % ποσμεδοχατεμψξοστψ (πεςιοδ N)
X_N = fft(x_N); % δπζ ποσμεδοχατεμψξοστι (πεςιοδ N)
MOD_N = (2/N)*abs(X_N); % ανπμιτυδξωκ σπελτς ποσμεδοχατεμψξοστι (πεςιοδ N)
MOD_N(1) = (1/N)*abs(X_N(1));
n1 = 0:(M-1); % δισλςετξοε ξοςνιςοχαξξοε χςενρ (πεςιοδ M)
k1 = 0:(M-1); % δισλςετξαρ ξοςνιςοχαξξαρ ώαστοτα (πεςιοδ M)
x_M = A1*cos(w1*n1); % ποσμεδοχατεμψξοστψ (πεςιοδ M)
X_M = fft(x_M); % δπζ ποσμεδοχατεμψξοστι (πεςιοδ M)
MOD_M = (2/M)*abs(X_M); % ανπμιτυδξωκ σπελτς ποσμεδοχατεμψξοστι (πεςιοδ M)
MOD_M(1) = (1/M)*abs(X_M(1));
P_N = N*f1/Fs; % ώισμο πεςιοδοχ δισλςετξοκ ηαςνοξιλι σ ώαστοτοκ f1 ξα πεςιοδε ποσμεδοχατεμψξοστι N
P_M = M*f1/Fs; % ώισμο πεςιοδοχ δισλςετξοκ ηαςνοξιλι σ ώαστοτοκ f1 ξα πεςιοδε ποσμεδοχατεμψξοστι M
disp('%')
disp('% δΜΡ ΧΩΧΟΔΑ ώισμα πεςιοδοχ ΔΙΣΛÒΕΤΞΟΚ ΗΑÒΝΟΞΙΛΙ σ ώαστοτοκ f1 ΞΑΦΝΙΤΕv<ENTER>')
pause
disp('%')
disp(['N = ',num2str(N),' --> P_N = ' num2str(P_N)])
disp(['M = ',num2str(M),' --> P_M = ' num2str(P_M)])
disp('%')
disp('% δΜΡ ΧΩΧΟΔΑ ηςαζιλοχ ανπμιτυδξωθ σπελτςοχ ΞΑΦΝΙΤΕ <ENTER>')
pause
figure('Name','Amplitude Spectrum','NumberTitle', 'off')
subplot(2,1,1), stem(k,MOD_N,'MarkerSize',3), grid, xlabel('k')
title(strcat(['Amplitude Spectrum of the Periodic Sequence N = ',num2str(N)]))
subplot(2,1,2), stem(k1,MOD_M,'MarkerSize',3), grid, xlabel('k')
title(strcat(['Amplitude Spectrum of the Periodic Sequence M = ',num2str(M)]))
disp('%')
disp('% δΜΡ ΠÒΟΔΟΜΦΕΞΙΡ ΞΑΦΝΙΤΕ <ENTER>')
pause
disp('%')

disp('% Π.3. ισσμεδοχαξιε χοϊνοφξοστι υνεξψϋεξιρ ςαστελαξιρ σπελτςα σ πονούψΰ ολξα')
win_M = hamming(M)'; % ολξο θόννιξηα ? χελτος-στομβεγ δμιξω M
xw_M = x_M.*win_M; % ποσμεδοχατεμψξοστψ, χϊχεϋεξξαρ ολξον
XW_M = fft(xw_M); % δπζ χϊχεϋεξξοκ ποσμεδοχατεμψξοστι
MODW_M =(2/M)*abs(XW_M); % ανπμιτυδξωκ σπελτς χϊχεϋεξξοκ ποσμεδοχατεμψξοστι
MODW_M(1) =(1/M)*abs(XW_M(1));
disp('%')
disp('% δΜΡ ΧΩΧΟΔΑ ηςαζιλοχ ανπμιτυδξωθ σπελτςοχ δο Ι ποσμε ΠÒΙΝΕΞΕΞΙΡ ολξα ΞΑΦΝΙΤΕ <ENTER>')
pause
figure('Name','Reducing Spectrum Leakage with the help of Window Functions','NumberTitle', 'off')
subplot(2,1,1), stem(k1,MOD_M,'MarkerSize',3), grid, xlabel('k')
title(strcat(['Amplitude spectrum without windowing M = ',num2str(M)]))
subplot(2,1,2), stem(k1,MODW_M,'MarkerSize',3), grid, xlabel('k')
title(strcat(['Amplitude spectrum with Hamming Window M = ',num2str(M)]))
disp('%')
disp('% δΜΡ ΠÒΟΔΟΜΦΕΞΙΡ ΞΑΦΝΙΤΕ <ENTER>')
pause
disp('%')

disp('% Π.4. ισσμεδοχαξιε όζζελτα ςαστελαξιρ σπελτςα δμρ συννω δχυθ δισλςετξωθ ηαςνοξιλ')
f1_1 = 1.1*f1; % ώαστοτω δισλςετξωθ ηαςνοξιλ (ηΓ)
f2_1 = 1.07*f2;
n = 0:(N-1); % δισλςετξοε ξοςνιςοχαξξοε χςενρ
k = 0:(N-1); % δισλςετξαρ ξοςνιςοχαξξαρ ώαστοτα
w1_1 = 2*pi*f1_1/Fs; w2_1 = 2*pi*f2_1/Fs; % ξοςνιςοχαξξωε ώαστοτω δισλςετξωθ ηαςνοξιλ (ςαδ)
x1 = A1*cos(w1_1*n)+A2*cos(w2_1*n); % ποσμεδοχατεμψξοστψ (πεςιοδ N)
X1 = fft(x1); % δπζ ποσμεδοχατεμψξοστι (πεςιοδ N)
MOD1 = (2/N)*abs(X1); % ανπμιτυδξωκ σπελτς ποσμεδοχατεμψξοστι
MOD1(1) = (1/N)*abs(X1(1));
P1_1 = N*f1_1/Fs; % ώισμο πεςιοδοχ δισλςετξοκ ηαςνοξιλι σ ώαστοτοκ f1_1 ξα πεςιοδε ποσμεδοχατεμψξοστι N
P2_1 = N*f2_1/Fs; % ώισμο πεςιοδοχ δισλςετξοκ ηαςνοξιλι σ ώαστοτοκ f2_1 ξα πεςιοδε ποσμεδοχατεμψξοστι N
disp('%')
disp('% δΜΡ ΧΩΧΟΔΑ ώισμα πεςιοδοχ ΔΙΣΛÒΕΤΞΩΘ ΗΑÒΝΟΞΙΛ σ ώαστοτανι f1_1 Ι f2_1 ΞΑΦΝΙΤΕ <ENTER>')
pause
disp('%')
disp([' f1_1 = ',num2str(f1_1),' --> P1_1 = ' num2str(P1_1)])
disp([' f2_1 = ',num2str(f2_1),' --> P2_1 = ' num2str(P2_1)])
win_N = hamming(N)'; % ολξο θόννιξηα ? χελτος-στομβεγ δμιξω N
xw1 = x1.*win_N; % ποσμεδοχατεμψξοστψ, χϊχεϋεξξαρ ολξον (πεςιοδ N)
XW1 = fft(xw1); % δπζ χϊχεϋεξξοκ ποσμεδοχατεμψξοστι (πεςιοδ N)
MODW1 =(2/N)*abs(XW1); % ανπμιτυδξωκ σπελτς ποσμεδοχατεμψξοστι
MODW1(1) =(1/M)*abs(XW1(1));
disp('%')
disp('% δΜΡ ΧΩΧΟΔΑ ηςαζιλοχ ανπμιτυδξωθ σπελτςοχ δο Ι ποσμε ΠÒΙΝΕΞΕΞΙΡ ολξα ΞΑΦΝΙΤΕ <ENTER>')
pause
figure('Name','Reducing Spectrum Leakage with the help of Window Functions','NumberTitle', 'off')
subplot(2,1,1), stem(k,MOD1,'MarkerSize',3), grid, xlabel('k')
title(strcat(['Amplitude spectrum without windowing N = ',num2str(N)]))
subplot(2,1,2), stem(k,MODW1,'MarkerSize',3), grid, xlabel('k')
title(strcat(['Amplitude spectrum with Hamming Window N = ',num2str(N)]))
disp('%')
disp('% δΜΡ ΠÒΟΔΟΜΦΕΞΙΡ ΞΑΦΝΙΤΕ <ENTER>')
pause
disp('%')

disp('% Π.5. υμυώϋεξιε ςαϊμιώεξιρ δισλςετξωθ ηαςνοξιλ σ βμιϊλο ςασπομοφεξξωνι ώαστοτανι')
f1_2 = 1.05*f1; % ώαστοτω δισλςετξωθ ηαςνοξιλ (ηΓ)
f2_2 = f1_2 + 1.1*Fs/N;
disp('%')
disp('% δΜΡ ΧΩΧΟΔΑ πεςιοδα ποσμεδοχατεμψξοστι Ι')
disp('% ώαστοτ ηαςνοξιλ ΞΑΦΝΙΤΕ <ENTER>')
pause
disp('%')
disp([' N = ',num2str(N)])
disp([' f1_2 = ',num2str(f1_2),' f2_2 = ' num2str(f2_2)])
Delta_N = Fs/N; % ςαϊςεϋεξιε πο ώαστοτε
Delta_f = abs(f1_2-f2_2); % ςασστορξιε νεφδυ ώαστοτανι
L = ceil(Fs/(Delta_f-Delta_N)); % χωβςαξξαρ δμιξα L
Delta_L = Fs/L; % πεςιοδ δισλςετιϊαγιι πο ώαστοτε πςι δμιξε L
disp('%')
disp('% δΜΡ ΧΩΧΟΔΑ ςαϊςεϋεξιρ πο ώαστοτε Delta_N,')
disp('% ςασστορξιρ ΝΕΦΔΥ ώαστοτανι Delta_f,')
disp('% δμιξω L ΠΟΣΜΕΔΟΧΑΤΕΜΨΞΟΣΤΙ')
disp('% Ι πεςιοδα δισλςετιϊαγιι πο ώαστοτε Delta_L ΞΑΦΝΙΤΕ <ENTER>')
pause
disp('%')
disp([' Delta_N = ',num2str(Delta_N)])
disp([' Delta_f = ',num2str(Delta_f)])
disp([' L = ',num2str(L)])
disp([' Delta_L = ',num2str(Delta_L)])
disp('%')
n = 0:(N-1); % δισλςετξοε ξοςνιςοχαξξοε χςενρ
w1_2 = 2*pi*f1_2/Fs; w2_2 = 2*pi*f2_2/Fs; % ξοςνιςοχαξξωε ώαστοτω
x2 = A1*cos(w1_2*n)+A2*cos(w2_2*n); % λοξεώξαρ ποσμεδοχατεμψξοστψ
X2 = fft(x2); % δπζ λοξεώξοκ ποσμεδοχατεμψξοστι δμιξω N
MOD2 = abs(X2); % νοδυμψ δπζ
X2_L = fft(x2,L); % δπζ λοξεώξοκ ποσμεδοχατεμψξοστι, δοπομξεξξοκ ξυμρνι δο δμιξω L
MOD2_L = abs(X2_L); % νοδυμψ δπζ
disp('% δΜΡ ΧΩΧΟΔΑ ηςαζιλοχ N-τοώεώξοηο δπζ Ι νοδυμρ σπελτςαμψξοκ')
disp('% πμοτξοστι, χοσσταξοχμεξξοκ πο L τοώλαν, ΞΑΦΝΙΤΕ <ENTER>')
pause
k = 0:(N-1); % δισλςετξαρ ξοςνιςοχαξξαρ ώαστοτα πςι δμιξε N
k1 = 0:(L-1); % δισλςετξαρ ξοςνιςοχαξξαρ ώαστοτα πςι δμιξε L
figure('Name','Discrete Harmonic Signal with Close Frequencies','NumberTitle', 'off')
subplot(2,1,1), stem(k,MOD2), grid, xlabel('k')
title(strcat(['DFT Modulus N = ',num2str(N)]))
subplot(2,1,2), plot(k1,MOD2_L,'r','MarkerSize',3, 'Linewidth',2)
grid, hold on, stem(k1,MOD2_L,':'), xlabel('k')
title(strcat(['Spectral Density Modulus L = ',num2str(L)]))
L_2 = ceil(L/2); % οσξοχξαρ πομοσα ώαστοτ L/2
[MODm, m]= max(MOD2_L(1:(L_2))); % ναλσινυν MODm ι ιξδελσ m χελτοςα MOD2_L (πεςχωκ πιλ)
k_1 = (m-1); f_1 = k_1*Delta_L; % δισλςετξαρ ξοςνιςοχαξξαρ ι αβσομΰτξαρ(ηΓ) ώαστοτω πεςχοηο πιλα
K = ceil(L/N); % λομιώεστχο οτσώετοχ ξα πεςιοδε δισλςετιϊαγιι Fs/N
K1 = m+K; K2 = m+2*K-1; % ξιφξρρ K1 Ι χεςθξρρ K2 ηςαξιγω ιξτεςχαμα πςι ποισλε χτοςοηο πιλα σπςαχα
[MODm1, m1]= max(MOD2_L(K1:K2)); % ναλσινυν MODm1 ι ιξδελσ m1 νοδυμρ δπζ MOD2_L ξα ιξτεςχαμε [K1 K2]
K3 = m-(2*K-1); K4 = m-K; % ξιφξρρ K3 Ι χεςθξρρ K4 ηςαξιγω ιξτεςχαμα πςι ποισλε χτοςοηο πιλα σμεχα
[MODm2, m2]= max(MOD2_L(K3:K4)); % ναλσινυν MODm2 ι ιξδελσ m2 νοδυμρ δπζ MOD2_L ξα ιξτεςχαμε [K3 K4]
if (MODm1>MODm2)
    k_2 = (K1+m1-1)-1; f_2 = k_2*Delta_L; % δισλςετξαρ ξοςνιςοχαξξαρ ι αβσομΰτξαρ (ηΓ) ώαστοτω χτοςοηο πιλα, εσμι οξ σπςαχα οτ πεςχοηο
else
    k_2 = (K3+m2-1)-1; f_2 = k_2*Delta_L; % δισλςετξαρ ξοςνιςοχαξξαρ ι αβσομΰτξαρ (ηΓ) ώαστοτω χτοςοηο πιλα, εσμι οξ σμεχα οτ πεςχοηο
end
disp('%')
disp('% οΠÒΕΔΕΜΙΤΕ ώαστοτω ηαςνοξιλ ΠΟ ηςαζιλυ')
disp('%')
disp('% δΜΡ ΧΩΧΟΔΑ ώαστοτ ηαςνοξιλ ΞΑΦΝΙΤΕ <ENTER>')
pause
disp('%')
disp([' k_1 = ',num2str(k_1),' f_1 = ' num2str(f_1)])
disp([' k_2 = ',num2str(k_2),' f_2 = ' num2str(f_2)])
disp('%')
disp('% δΜΡ ΠÒΟΔΟΜΦΕΞΙΡ ΞΑΦΝΙΤΕ <ENTER>')
pause
disp('%')

disp('% Π.6. χωώισμεξιε λςυηοχοκ σχεςτλι')
x3 = N*[0.1 0.2 0.3 0.4 0.5]; % πεςχαρ ποσμεδοχατεμψξοστψ
x4 = N*[0.5 0.4 0.3 0.2 0.1]; % χτοςαρ ποσμεδοχατεμψξοστψ
y34 = ifft(fft(x3).*fft(x4));% λςυηοχαρ σχεςτλα ποσμεδοχατεμψξοστεκ
L34 = length(y34); % πεςιοδ λςυηοχοκ σχεςτλι
disp('%')
disp('% δΜΡ ΧΩΧΟΔΑ ΗÒΑΖΙΛΟΧ ποσμεδοχατεμψξοστεκ Ι λςυηοχοκ ΣΧΕÒΤΛΙ (3 ΠΕÒΙΟΔΑ)ΞΑΦΝΙΤΕ <ENTER>')
pause
figure('Name','Sequences x3, x4, y34','NumberTitle', 'off')
subplot(3,1,1), stem((0:3*L34-1),...
    repmat(x3,1,3),'fill','Linewidth',2,'MarkerSize',3), grid
xlabel('n'), title('Periodic Sequence x3(n)')
subplot(3,1,2), stem((0:3*L34-1), repmat(x4,1,3),'fill','Linewidth',2,'MarkerSize',3), grid
xlabel('n'), title('Periodic Sequence x4(n)')
subplot(3,1,3), stem((0:3*L34-1), repmat(y34,1,3),'fill','Linewidth',2,'MarkerSize',3), grid, xlabel('n')
title('Periodic Sequence y34(n) ? Convolution with FFT and IFFT')
disp('%')
disp('% δΜΡ ΠÒΟΔΟΜΦΕΞΙΡ ΞΑΦΝΙΤΕ <ENTER>')
pause
disp('%')

disp('% Π.7. χωώισμεξιε μιξεκξοκ σχεςτλι')
x5 = N*[0.1 0.2 0.3]; % πεςχαρ ποσμεδοχατεμψξοστψ
x6 = N*[0.3 0.2 0.1 0.2 0.3]; % χτοςαρ ποσμεδοχατεμψξοστψ
y56_1 = conv(x5,x6); % μιξεκξαρ σχεςτλα,χωώισμεξξαρ σ πονούψΰ ζυξλγιι conv
y56_2 = fftfilt(x5,x6); % μιξεκξαρ σχεςτλα, χωώισμεξξαρ σ πονούψΰ ζυξλγιι fftfilt
MAX = max([length(y56_1) length(y56_2)]); % ναλσιναμψξαρ δμιξα σχεςτλι
disp('%')
disp('% δΜΡ ΧΩΧΟΔΑ ηςαζιλοχ ποσμεδοχατεμψξοστεκ Ι μιξεκξοκ ΣΧΕÒΤΛΙ ΞΑΦΝΙΤΕ <ENTER>')
pause
figure('Name','Sequences x5, x6, y56_1, y56_2','NumberTitle', 'off')
subplot(4,1,1)
stem((0:length(x5)-1),x5,'fill','Linewidth',2,'MarkerSize',3)
grid, xlabel('n'), title('Sequence x5(n)'), xlim([0 MAX-1])
subplot(4,1,2)
stem((0:length(x6)-1),x6,'fill','Linewidth',2,'MarkerSize',3)
grid, xlabel('n'), title('Sequence x6(n)'), xlim([0 MAX-1])
subplot(4,1,3)
stem((0:length(y56_1)-1),y56_1,'fill','Linewidth',2,'MarkerSize',3)
grid, xlabel('n'), title('Sequence y56(n) ? Convolution'), xlim([0 MAX-1])
subplot(4,1,4)
stem((0:length(y56_2)-1),y56_2,'fill','Linewidth',2,'MarkerSize',3)
grid, xlabel('n'), title('Sequence y56(n) ? Convolution with FFT and IFFT'),
xlim([0 MAX-1])
disp('%')
disp('% δΜΡ ΠÒΟΔΟΜΦΕΞΙΡ ΞΑΦΝΙΤΕ <ENTER>')
pause
disp('%')

disp('% Π.8. χωώισμεξιε ςεαλγιι μδσ πο ζοςνυμε σχεςτλι')
    b0 = 0.5 + 0.02*Nb;
    b1 = b0*(-1)^(Nb+1)*(0.9822 + 0.0178*Nb);
    b2 = b0*(0.8 + 0.2*mod(Nb,5));
b = [b0 b1 b2]; % λοόζζιγιεξτω ώισμιτεμρ πεςεδατοώξοκ ζυξλγιι
    a0 = 1;
    a1 = (-1)^(Nb)*(0.7778 + 0.025*Nb);
    a2 = 0.64 + 0.006*Nb;
a = [a0 a1 a2]; % λοόζζιγιεξτω ϊξανεξατεμρ πεςεδατοώξοκ ζυξλγιι
N1 = mod(Nb,10) + 20; % δμιξα ινπυμψσξοκ θαςαλτεςιστιλι
N2 = mod(Nb,10) + 30; % δμιξα χοϊδεκστχιρ
h = impz(b,a,N1)'; % ινπυμψσξαρ θαςαλτεςιστιλα
x7 = input_1(N2); % χοϊδεκστχιε
y7_1 = conv(x7,h); % ςεαλγιρ, χωώισμεξξαρ σ πονούψΰ ζυξλγιι conv
y7_2 = fftfilt(h,x7); % ςεαλγιρ, χωώισμεξξαρ σ πονούψΰ ζυξλγιι fftfilt
L=N1+N2-1; % δμιξα σχεςτλι, χωώισμεξξοκ σ πονούψΰ ζυξλγιι conv
disp('%')
disp('% δΜΡ ΧΩΧΟΔΑ ΗÒΑΖΙΛΟΧ ιθ, χοϊδεκστχιρ Ι ςεαλγιι ΞΑΦΝΙΤΕ <ENTER>')
pause
figure('Name','Impulse Response, Input and Output Signals','NumberTitle','off')
subplot(4,1,1)
stem(0:length(h)-1,h,'Linewidth',2,'MarkerSize',3), grid,
xlabel('n'), title('Impulse Response h(n)'), xlim([0 L-1])
subplot(4,1,2)
stem(0:length(x7)-1,x7,'Linewidth',2,'MarkerSize',3), grid
xlabel('n'), title('Input Signal x7(n)'), xlim([0 L-1])
subplot(4,1,3)
stem(0:length(y7_1)-1,y7_1,'Linewidth',2,'MarkerSize',3),
grid
xlabel('n'), title('Output Signal y7(n) ? Convolution'), xlim([0 L-1])
subplot(4,1,4)
stem(0:length(y7_2)-1,y7_2,'Linewidth',2,'MarkerSize',3), grid
xlabel('n'), title('Output Signal y7(n) ? Convolution with FFT and IFFT'),
xlim([0 L-1])
disp('%')
disp('% δΜΡ ΠÒΟΔΟΜΦΕΞΙΡ ΞΑΦΝΙΤΕ <ENTER>')
pause
disp('%')

disp('% Π.9. χωώισμεξιε ςεαλγιι μδσ νετοδον πεςελςωτιρ σ ξαλοπμεξιεν')
N3 = mod(Nb,10) + 200;
x8 = input_1(N3); % χοϊδεκστχιε
y8_1 = fftfilt(h,x8); % ςεαλγιρ, χωώισμεξξαρ σ πονούψΰ ζυξλγιι fftfilt
y8_2 = fftfilt(h,x8,N1); % ςεαλγιρ, χωώισμεξξαρ σ πονούψΰ ζυξλγιι fftfilt νετοδον ξαλοπμεξιρ σ πεςελςωτιεν
disp('%')
disp('% δΜΡ ΧΩΧΟΔΑ ηςαζιλοχ χοϊδεκστχιρ Ι ςεαλγιι ΞΑΦΝΙΤΕ <ENTER>')
pause
figure('Name','Impulse Response, Input and Output Signals ? Overlap-add method','NumberTitle', 'off')
subplot(4,1,1)
stem(0:length(h)-1,h,'MarkerSize',3), grid
xlabel('n'), title('Impulse Response h(n)'), xlim([0 N3-1])
subplot(4,1,2), stem(0:length(x8)-1,x8,'MarkerSize',3), grid
xlabel('n'), title('Input Signal x8(n)')
subplot(4,1,3),stem(0:length(y8_1)-1,y8_1,'MarkerSize',3), grid
xlabel('n')
title('Output Signal y8(n) ? Convolution with FFT and IFFT')
subplot(4,1,4), stem(0:length(y8_2)-1,y8_2,'MarkerSize',3), grid
xlabel('n')
title('Output Signal y8(n) ? Convolution with Overlap-add method')
disp('%')
disp('% ςαβοτα ϊαχεςϋεξα')