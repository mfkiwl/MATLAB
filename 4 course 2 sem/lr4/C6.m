clc
clear
Nb = 4; % מןםוע געיחבהש (׳Ùֱֲׂװ״ ׀ֿ ׳ֱֱֹׂ־װױ)
N = 64; % הלימב (נועיןה) נןףלוהןקבפולרמןףפי 1
M = 71; % הלימב (נועיןה) נןףלוהןקבפולרמןףפי 2
Fs = 2000*mod(Nb, 5) + 1; % ‏בףפןפב היףכעופיתבדיי (חֳ)
A1 = 1 + 0.01*Nb; % בםנליפץהש היףכעופמשט חבעםןמיכ
A2 = 2*A1;
f1 = Fs/4; % ‏בףפןפש היףכעופמשט חבעםןמיכ (חֳ)
f2 = 1.5*f1;
C = 1;
w0 = pi/2;
omega = w0/4;
k_m = 0.5;
x8 = [];
N = 4*N;
for i=1:N
    x8(i) = C*(1 + k_m*cos(omega*i))*cos(w0*i);
end
    b0 = 0.5 + 0.02*Nb;
    b1 = b0*(-1)^(Nb+1)*(0.9822 + 0.0178*Nb);
    b2 = b0*(0.8 + 0.2*mod(Nb,5));
b = [b0 b1 b2]; % כןüזזידיומפש ‏יףליפולס נועוהבפן‏מןך זץמכדיי
    a0 = 1;
    a1 = (-1)^(Nb)*(0.7778 + 0.025*Nb);
    a2 = 0.64 + 0.006*Nb;
a = [a0 a1 a2]; % כןüזזידיומפש תמבםומבפולס נועוהבפן‏מןך זץמכדיי
N1 = mod(Nb,10) + 20; % הלימב יםנץלרףמןך טבעבכפועיףפיכי
N2 = N;
h = impz(b,a,N1)'; % יםנץלרףמבס טבעבכפועיףפיכב

disp('% ׀.9. קש‏יףלומיו עובכדיי להף םופןהןם נועוכעשפיס ף מבכןנלומיום')
y8_1 = fftfilt(h,x8); % עובכדיס, קש‏יףלוממבס ף נןםן‎רא זץמכדיי fftfilt
y8_2 = fftfilt(h,x8,N1); % עובכדיס, קש‏יףלוממבס ף נןםן‎רא זץמכדיי fftfilt םופןהןם מבכןנלומיס ף נועוכעשפיום
disp('%')
disp('% הּׁ ׳Ù׳ֱִֿ חעבזיכןק קןתהוךףפקיס ֹ עובכדיי ־ֱײֹֽװֵ <ENTER>')
pause
figure('Name','Impulse Response, Input and Output Signals ? Overlap-add method','NumberTitle', 'off')
subplot(4,1,1)
stem(0:length(h)-1,h,'MarkerSize',3), grid
xlabel('n'), title('Impulse Response h(n)'), xlim([0 N2-1])
subplot(4,1,2), stem(0:length(x8)-1,x8,'MarkerSize',3), grid
xlabel('n'), title('Input Signal x8(n)')
subplot(4,1,3),stem(0:length(y8_1)-1,y8_1,'MarkerSize',3), grid
xlabel('n')
title('Output Signal y8(n) ? Convolution with FFT and IFFT')
subplot(4,1,4), stem(0:length(y8_2)-1,y8_2,'MarkerSize',3), grid
xlabel('n')
title('Output Signal y8(n) ? Convolution with Overlap-add method')
disp('%')
disp('% הּׁ ׀ִּֿֿׂײֵ־ֹׁ ־ֱײֹֽװֵ <ENTER>')
pause
disp('%')
disp('% עבגןפב תבקועûומב')