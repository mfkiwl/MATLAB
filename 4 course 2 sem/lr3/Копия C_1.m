all_figs = findobj(0, 'type', 'figure');  % если надо закрыть много фигур
delete(all_figs)
clc
clear
disp('% С_1')
%%
    Nb = 4; % НОМЕР БРИГАДЫ
    N = 64; % ДЛИНА (ПЕРИОД) ПОСЛЕДОВАТЕЛЬНОСТИ
    Fs = 2000*(mod(Nb, 5) + 1); % ЧАСТОТА ДИСКРЕТИЗАЦИИ
    T = 1/Fs; % ПЕРИОД ДИСКРЕТИЗАЦИИ 1/Fs
    A1 = 1+0.01*Nb; % АМПЛИТУДЫ ДИСКРЕТНЫХ ГАРМОНИК
    A2 = 2*A1;
    f1 = Fs/8; % ЧАСТОТЫ (Гц) ДИСКРЕТНЫХ ГАРМОНИК
    f2 = Fs/12;
    e1 = 0.3; % посмотреть на спектр и задать значение порога e = A/Amax
%%
% DATA=0;
% while DATA==0
%     Nb = input('Nb = '); % НОМЕР БРИГАДЫ
%     N = input('N = '); % ДЛИНА (ПЕРИОД) ПОСЛЕДОВАТЕЛЬНОСТИ
%     Fs = input('Fs = '); % ЧАСТОТА ДИСКРЕТИЗАЦИИ
%     T = input('T = '); % ПЕРИОД ДИСКРЕТИЗАЦИИ 1/Fs
%     A1 = input('A1 = '); % АМПЛИТУДЫ ДИСКРЕТНЫХ ГАРМОНИК
%     A2 = input('A2 = ');
%     f1 = input('f1 = '); % ЧАСТОТЫ (Гц) ДИСКРЕТНЫХ ГАРМОНИК
%     f2 = input('f2 = ');
%     disp('% Проверьте ПРАВИЛЬНОСТЬ ввода ИСХОДНЫХ ДАННЫХ')
%     disp('% При ПРАВИЛЬНЫХ ИСХОДНЫХ ДАННЫХ введите 1')
%     disp('% При НЕПРАВИЛЬНЫХ ИСХОДНЫХ ДАННЫХ введите 0 и ПОВТОРИТЕ ввод')
%     DATA = input('--> ');
% end
disp('%')
disp('% Для вывода ИСХОДНЫХ АМПЛИТУД и ЧАСТОТ ДИСКРЕТНЫХ ГАРМОНИК нажмите<ENTER>')
pause
disp('%')
disp([' A1 = ' num2str(A1) ' A2 = ' num2str(A2)])
disp([' f1 = ' num2str(f1) ' f2 = ' num2str(f2)])
disp('%')
disp('%')
disp('% Для продолжения нажмите <ENTER>')
pause
disp('%')
disp('%')
%%
disp('% п.1. ВЫЧИСЛЕНИЕ АМПЛИТУДНОГО И ФАЗОВОГО СПЕКТРОВ ПЕРИОДИЧЕСКОЙ ПОСЛЕДОВАТЕЛЬНОСТИ')
disp('%')
disp('%')
disp('% Для вывода ГРАФИКОВ периодической последовательности нажмите <ENTER>')
pause
n = 0:(N-1); % ДИСКРЕТНОЕ НОРМИРОВАННОЕ ВРЕМЯ
k = 0:(N-1); % ДИСКРЕТНАЯ НОРМИРОВАННАЯ ЧАСТОТА
w1 = 2*pi*f1/Fs; w2 = 2*pi*f2/Fs; % НОРМИРОВАННЫЕ ЧАСТОТЫ ДИСКРЕТНЫХ ГАРМОНИК (РАД)
x = A1*cos(w1*n+pi/4)+A2*cos(w2*n+pi/8); % ПЕРИОДИЧЕСКАЯ ПОСЛЕДОВАТЕЛЬНОСТЬ
X = fft(x); % ДПФ ПЕРИОДИЧЕСКОЙ ПОСЛЕДОВАТЕЛЬНОСТИ
MOD = (2/N)*abs(X); % АМПЛИТУДНЫЙ СПЕКТР ПЕРИОДИЧЕСКОЙ ПОСЛЕДОВАТЕЛЬНОСТИ
MOD(1) = (1/N)*abs(X(1));
PHASE = angle(X); % ФАЗОВЫЙ СПЕКТР ПЕРИОДИЧЕСКОЙ ПОСЛЕДОВАТЕЛЬНОСТИ
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
x = ifft(X); % ПЕРИОДИЧЕСКАЯ ПОСЛЕДОВАТЕЛЬНОСТЬ,ВЫЧИСЛЕННАЯ С ПОМОЩЬЮ ОДПФ
subplot(3,1,3), stem(n,x,'MarkerSize',3,'Linewidth',2)
grid, xlabel('n')
ylabel('x(n)'), title(strcat(['Periodic Sequence x = ifft(X) N =',num2str(N)]))
disp('%')
disp('%')
disp('% Для вывода ГРАФИКОВ АМПЛИТУДНОГО СПЕКТРА периодической последовательности нажмите <ENTER>')
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
disp('% Для вывода ГРАФИКОВ ФАЗОВОГО СПЕКТРА периодической последовательности нажмите <ENTER>')
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
disp('% Для продолжения нажмите <ENTER>')
pause
disp('%')
disp('%')

%%
disp('% п.3. ОПРЕДЕЛЕНИЕ АМПЛИТУД И ЧАСТОТ ДИСКРЕТНЫХ ГАРМОНИК')
disp('%')
disp('%')
disp('% Для вывода ВЫХОДНЫХ ПАРАМЕТРОВ ФУНКЦИИ fft_e1 нажмите <ENTER>')
pause
[MODm,m] = fft_e1(MOD,e1); % ВНЕШНЯЯ ФУНКЦИЯ ДЛЯ ВЫДЕЛЕНИЯ АМПЛИТУД И ЧАСТОТ ГАРМОНИК ПОЛЕЗНОГО СИГНАЛА ПО ПЕРВОМУ КРИТЕРИЮ
disp('%')
disp('%')
disp('% Для вывода АМПЛИТУД и ЧАСТОТ ДИСКРЕТНЫХ ГАРМОНИК нажмите <ENTER>')
pause
A1 = MODm(1); A2 = MODm(2); A3 = MODm(3);  % АМПЛИТУДЫ ДИСКРЕТНЫХ ГАРМОНИК
k1 = m(1); k2 = m(2); k3 = m(3);  % ДИСКРЕТНЫЕ НОРМИРОВАННЫЕ ЧАСТОТЫ
f1 = k1*Fs/N; f2 = k2*Fs/N; f3 = k3*Fs/N; % ЧАСТОТЫ (Гц) ДИСКРЕТНЫХ ГАРМОНИК
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
disp('% СРАВНИТЕ с ВЫХОДНЫМИ ПАРАМЕТРАМИ функции fft_e1 и исходными данными')
disp('%')
disp('%')
disp('% Для продолжения нажмите <ENTER>')
pause
disp('%')
disp('%')
disp('% РАБОТА ЗАВЕРШЕНА')