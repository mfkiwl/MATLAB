all_figs = findobj(0, 'type', 'figure');  % ÅÓÌÉ ÎÁÄÏ ÚÁËÒÙÔØ ÍÎÏÇÏ ÆÉÇÕÒ
delete(all_figs)
clc
clear
disp('% ף_1')
%%
    Nb = 4; % מןםוע געיחבהש
    N = 64; % הלימב (נועיןה) נןףלוהןקבפולרמןףפי
    Fs = 2000*(mod(Nb, 5) + 1); % ‏בףפןפב היףכעופיתבדיי
    T = 1/Fs; % נועיןה היףכעופיתבדיי 1/Fs
    A1 = 1+0.01*Nb; % בםנליפץהש היףכעופמשט חבעםןמיכ
    A2 = 2*A1;
    f1 = Fs/8; % ‏בףפןפש (חÃ) היףכעופמשט חבעםןמיכ
    f2 = Fs/12;
    e1 = 0.3; % ÐÏÓÍÏÔÒÅÔØ ÎÁ ÓÐÅËÔÒ É ÚÁÄÁÔØ ÚÎÁÞÅÎÉÅ ÐÏÒÏÇÁ e = A/Amax
%%
% DATA=0;
% while DATA==0
%     Nb = input('Nb = '); % מןםוע געיחבהש
%     N = input('N = '); % הלימב (נועיןה) נןףלוהןקבפולרמןףפי
%     Fs = input('Fs = '); % ‏בףפןפב היףכעופיתבדיי
%     T = input('T = '); % נועיןה היףכעופיתבדיי 1/Fs
%     A1 = input('A1 = '); % בםנליפץהש היףכעופמשט חבעםןמיכ
%     A2 = input('A2 = ');
%     f1 = input('f1 = '); % ‏בףפןפש (חÃ) היףכעופמשט חבעםןמיכ
%     f2 = input('f2 = ');
%     disp('% נÒÏ×ÅÒØÔÅ נעבקילרמןףפר ××ÏÄÁ יףטןהמשט הבממשט')
%     disp('% נÒÉ נעבקילרמשט יףטןהמשט הבממשט ××ÅÄÉÔÅ 1')
%     disp('% נÒÉ מונעבקילרמשט יףטןהמשט הבממשט ××ÅÄÉÔÅ 0 É נןקפןעיפו ××ÏÄ')
%     DATA = input('--> ');
% end
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ יףטןהמשט בםנליפץה É ‏בףפןפ היףכעופמשט חבעםןמיכ ÎÁÖÍÉÔÅ<ENTER>')
pause
disp('%')
disp([' A1 = ' num2str(A1) ' A2 = ' num2str(A2)])
disp([' f1 = ' num2str(f1) ' f2 = ' num2str(f2)])
disp('%')
disp('%')
disp('% הÌÑ ÐÒÏÄÏÌÖÅÎÉÑ ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp('%')
%%
disp('% Ð.1. קש‏יףלומיו בםנליפץהמןחן י זבתןקןחן ףנוכפעןק נועיןהי‏וףכןך נןףלוהןקבפולרמןףפי')
disp('%')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ חעבזיכןק ÐÅÒÉÏÄÉÞÅÓËÏÊ ÐÏÓÌÅÄÏ×ÁÔÅÌØÎÏÓÔÉ ÎÁÖÍÉÔÅ <ENTER>')
pause
n = 0:(N-1); % היףכעופמןו מןעםיעןקבממןו קעוםס
k = 0:(N-1); % היףכעופמבס מןעםיעןקבממבס ‏בףפןפב
w1 = 2*pi*f1/Fs; w2 = 2*pi*f2/Fs; % מןעםיעןקבממשו ‏בףפןפש היףכעופמשט חבעםןמיכ (עבה)
x = A1*cos(w1*n+pi/4)+A2*cos(w2*n+pi/8); % נועיןהי‏וףכבס נןףלוהןקבפולרמןףפר
X = fft(x); % הנז נועיןהי‏וףכןך נןףלוהןקבפולרמןףפי
MOD = (2/N)*abs(X); % בםנליפץהמשך ףנוכפע נועיןהי‏וףכןך נןףלוהןקבפולרמןףפי
MOD(1) = (1/N)*abs(X(1));
PHASE = angle(X); % זבתןקשך ףנוכפע נועיןהי‏וףכןך נןףלוהןקבפולרמןףפי
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
x = ifft(X); % נועיןהי‏וףכבס נןףלוהןקבפולרמןףפר,קש‏יףלוממבס ף נןםן‎רא ןהנז
subplot(3,1,3), stem(n,x,'MarkerSize',3,'Linewidth',2)
grid, xlabel('n')
ylabel('x(n)'), title(strcat(['Periodic Sequence x = ifft(X) N =',num2str(N)]))
disp('%')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ חעבזיכןק בםנליפץהמןחן ףנוכפעב ÐÅÒÉÏÄÉÞÅÓËÏÊ ÐÏÓÌÅÄÏ×ÁÔÅÌØÎÏÓÔÉ ÎÁÖÍÉÔÅ <ENTER>')
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
disp('% הÌÑ ×Ù×ÏÄÁ חעבזיכןק זבתןקןחן ףנוכפעב ÐÅÒÉÏÄÉÞÅÓËÏÊ ÐÏÓÌÅÄÏ×ÁÔÅÌØÎÏÓÔÉ ÎÁÖÍÉÔÅ <ENTER>')
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
disp('% הÌÑ ÐÒÏÄÏÌÖÅÎÉÑ ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp('%')

%%
disp('% Ð.3. ןנעוהולומיו בםנליפץה י ‏בףפןפ היףכעופמשט חבעםןמיכ')
disp('%')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ קשטןהמשט נבעבםופעןק זץמכדיי fft_e1 ÎÁÖÍÉÔÅ <ENTER>')
pause
[MODm,m] = fft_e1(MOD,e1); % קמוûמסס זץמכדיס הלס קשהולומיס בםנליפץה י ‏בףפןפ חבעםןמיכ נןלותמןחן ףיחמבלב נן נועקןםץ כעיפועיא
disp('%')
disp('%')
disp('% הÌÑ ×Ù×ÏÄÁ בםנליפץה É ‏בףפןפ היףכעופמשט חבעםןמיכ ÎÁÖÍÉÔÅ <ENTER>')
pause
A1 = MODm(1); A2 = MODm(2); A3 = MODm(3);  % בםנליפץהש היףכעופמשט חבעםןמיכ
k1 = m(1); k2 = m(2); k3 = m(3);  % היףכעופמשו מןעםיעןקבממשו ‏בףפןפש
f1 = k1*Fs/N; f2 = k2*Fs/N; f3 = k3*Fs/N; % ‏בףפןפש (חÃ) היףכעופמשט חבעםןמיכ
disp('%')
disp('%')
% disp([' A1 = ' num2str(A1) ' A2 = ' num2str(A2)])
% disp([' k1 = ' num2str(k1) ' k2 = ' num2str(k2)])
% disp([' f1 = ' num2str(f1) ' f2 = ' num2str(f2)])
disp([' A1 = ' num2str(A1) ' A2 = ' num2str(A2) ' A3 = ' num2str(A3)])
disp([' k1 = ' num2str(k1) ' k2 = ' num2str(k2) ' k3 = ' num2str(k3)])
disp([' f1 = ' num2str(f1) ' f2 = ' num2str(f2) ' f3 = ' num2str(f3)])
disp('%')
disp('%')
disp('% ףעבקמיפו Ó קשטןהמשםי נבעבםופעבםי ÆÕÎËÃÉÉ fft_e1 É ÉÓÈÏÄÎÙÍÉ ÄÁÎÎÙÍÉ')
disp('%')
disp('%')
disp('% הÌÑ ÐÒÏÄÏÌÖÅÎÉÑ ÎÁÖÍÉÔÅ <ENTER>')
pause
disp('%')
disp('%')
disp('% עבגןפב תבקועûומב')