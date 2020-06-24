b0 = 1;
b1 = -0.5;
b2 = 0;
a0 = 1;
a1 = -1;
a2 = 0.5;
b = [b0, b1];
a = [a0, a1, a2];
N1 = 20;
%%
% h1 = impz(b,a,N1); % импульсная характеристика 
% n = 0:(N1-1); % нормированное время 
% figure('Name', 'Импульсная характеристика'); 
% stem(n,h1,'fill','MarkerSize',3), grid; xlabel('n'), ylabel('h(n)'), title('ИХ - impz')
%%
% clc
% w = 0:0.001:pi;
% a = (b0 + b1*cos(w) + b2*cos(2*w)).^2 + (b1*sin(w) + b2*sin(2*w)).^2;
% b = (1 + a1*cos(w) + a2*cos(2*w)).^2 + (a1*sin(w) + a2*sin(2*w)).^2;
% c = (a1*sin(w) + a2*sin(2*w))./(1 + a1*cos(w) + a2*cos(2*w));
% d = (b1*sin(w) + b2*sin(2*w))./(b0 + b1*cos(w) + b2*cos(2*w));
% 
% Amp = sqrt(a./b);
% Phi = atan(c) - atan(d);
% 
% figure (1)
% plot(w, Amp/max(Amp))
% grid on
% xlabel('w, рад');
% ylabel('A(w)');
% figure (2)
% plot(w, Phi)
% grid on
% xlabel('w, рад');
% ylabel('Phi(w)');
Fs = 20;
f = 0:Fs/100:Fs/2; % Вектор абсолютных частот
H = freqz(b,a,f,Fs); % Комплексный коэффициент усиления
MAG = abs(H); % АЧХ
PHASE = angle(H); % ФЧХ
subplot(2,2,2);
plot(f,MAG), grid, xlabel('f (Hz)'), title('MAGNITUDE - |Н(f)|')
subplot(2,2,4);
plot(f,PHASE), grid, xlabel('f (Hz)'), title('PHASE - arg [H(f)] (rad)')
%%
[r,p,c] = residuez(b,a); 