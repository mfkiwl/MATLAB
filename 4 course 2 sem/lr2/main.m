%% Объявим переменные
Nbr = 4;
% 1. Коэффициенты числителя передаточной функции
b0=0.5 + 0.02*Nbr;
b1=-b0*(0.9822+0.0178*Nbr);
b2=b0*(0.8+0.2*mod(Nbr,5));
b = [b0, b1, b2];
% 2. Коэффициенты знаменателя передаточной функции 
a0=1;
a1=0.7788+0.025*Nbr;
a2=0.64+0.006*Nbr;
a = [a0, a1, a2];
% 3. Длина ИХ
N1=mod(Nbr, 10)+20;
% 4. Длина воздействия
N2=mod(Nbr, 10)+30;
% 5. Частота дискретизации
Fs=1000*Nbr;

%% Вычисление h1 длины N1 с помощью функции impz с выводом графика
h1 = impz(b,a,N1); % импульсная характеристика 
n = 0:(N1-1); % нормированное время 
figure('Name', 'Импульсная характеристика'); 
subplot(2,1,1);
stem(n,h1,'fill','MarkerSize',3), grid; xlabel('n'), ylabel('h(n)'), title('ИХ - impz')

%% Вычисление h2 с помощью функции filter с выводом графика
u0 = [1, zeros(1, (N1-1))];
h2 = filter(b, a, u0);
subplot(2,1,2); stem(n,h2,'fill','MarkerSize',3), grid; xlabel('n'), ylabel('h(n)'), title('ИХ - filter')

%% Вычисление реакции y1(n) (идентификатор y1) по формуле свертки
x = input_1(N2); % воздействие (дискретный прямоугольный импульс)
y1 = conv(x,h1); % реакция (длина равно длине свертки)
% Следует вывести график воздействия x1(n) и два графика реакции y1(n)
%с длиной L, равной длине свертки L , и длиной, ограниченной до длины воздействия.
L = N1+N2-1;
n = 0:(N2-1);
n1 = 0:(L-1);
figure('Name','Входной и выходной сигналы','NumberTitle', 'off')
subplot(4,1,1);
% длина свертки
% дискретное нормированное время для воздействия
% дискретное нормированное время для свертки
stem(n,x,'fill','MarkerSize',3), grid;
xlabel('n'), ylabel('x(n)');
title('Входной - дискретный прямоугольный импульс');
subplot(4,1,2);
stem(n1,y1,'fill','MarkerSize',3), grid; xlabel('n'), ylabel('y(n)');
title('Выходной сигнал - conv (length = L)')
subplot(4,1,3);
stem(n,y1(1:N2),'fill','MarkerSize',3), grid;
xlabel('n'), ylabel('y1(n)');
title('Выходной сигнал y1(n) - conv (length = N2)');
%% Вычисление реакции y2(n) по разностному уравнению при помощи функции filter
y2 = filter(b,a,x);
subplot(4,1,4);
stem(n,y2,'fill','MarkerSize',3), grid
xlabel('n'), ylabel('y(n)')
title('Выходной сигнал y2(n) - filter (length = N2)');
%% ПФ в виде произведения простейших множителей
[q,p,K] = tf2zpk(b,a); % нули (q) и полюсы (p) в алгебраической форме и коэффициент усиления (K)
rq = abs(q); % модули комплексно сопряженных нулей
wq = angle(q); % аргументы комплексно сопряженных нулей %
rp = abs(p); % модули комплексно сопряженных полюсов 
wp = angle(p) % аргументы комплексно сопряженных полюсов
%% ПФ в виде произведения множителей второго порядка 
[s,G] = tf2sos(b,a) % коэффициенты (s) и коэффициент усиления (G)
%% ПФ в виде суммы простых дробей
[r,p,c] = residuez(b,a); % коэффициенты разложения (r) и полюсы (p)
% в алгебраической форме и целая часть (c) (c)
rr = abs(r); % модули комплексно-сопряженных коэффициентов разложения 
wr = angle(r); % аргументы комплексно сопряженных коэффициентов
%% Вывод карты нулей и полюсов.
figure('Name',' Z-plane zero-pole plot','NumberTitle', 'off');
zplane(b,a), title('Z-plane zero-pole plot'), grid
xlabel('Re'), ylabel('jIm')
%% Вычисление АЧХ и ФЧХ в шкале нормированных частот.
w = 0:pi/100:pi; % вектор нормированных частот (рад)
H_w = freqz(b,a,w); % комплексный коэффициент передачи
MAG_w = abs(H_w); % АЧХ
PHASE_w = angle(H_w); % ФЧХ
figure('Name','Magnitude and Phase Responses','NumberTitle', 'off')
subplot(2,2,1);
plot(w,MAG_w), grid;
xlabel('w (rad)'), title('MAGNITUDE -|Н(w)|')
subplot(2,2,3);
plot(w,PHASE_w), grid;
xlabel('w (rad)'), title('PHASE - arg[H(w)] (rad)')
%% Вычисление АЧХ и ФЧХ в шкале абсолютных частот.
f = 0:Fs/100:Fs/2; % Вектор абсолютных частот
H = freqz(b,a,f,Fs); % Комплексный коэффициент усиления
MAG = abs(H); % АЧХ
PHASE = angle(H); % ФЧХ
subplot(2,2,2);
plot(f,MAG), grid, xlabel('f (Hz)'), title('MAGNITUDE - |Н(f)|')
subplot(2,2,4);
plot(f,PHASE), grid, xlabel('f (Hz)'), title('PHASE - arg [H(f)] (rad)')
%% Анализ влияния нулей и полюсов на вид АЧХ.
b(1,:) = [1 0 0];
b(2,:) = [1 0 0];
b(3,:) = [1 0 0];
b(4,:) = [1 1 0];
a(1,:) = a;
a(2,:) = [1 -a(1,2) a(1,3)];
a(3,:) = [1 a(1,2) 1.2*a(1,3)];
a(4,:) = [1 a(1,2) a(1,3)];
w = 0:pi/100:pi; % ВЕКТОР НОРМИРОВАННЫХ ЧАСТОТ (РАД) 
for i=1:4
    H3(:,i) = freqz(b(i,:),a(i,:),w); % ЧАСТОТНАЯ ХАРАКТЕРИСТИКА - i-й СТОЛБЕЦ МАТРИЦЫ
    MAG3(:,i) = abs(H3(:,i)); MAX(:,i) = max(MAG3(:,i)); % АЧХ - i-й СТОЛБЕЦ МАТРИЦЫ - И МАКСИМУМ АЧХ
    MAGN(:,i) = MAG3(:,i)/MAX(:,i); % НОРМИРОВАННАЯ АЧХ - i-й СТОЛБЕЦ МАТРИЦЫ
end
figure('Name','Z-plane zero-pole plots and Normalized Magnitudes','NumberTitle', 'off')
for i = 1:4
    subplot(4,2,2*i-1), zplane(b(i,:),a(i,:)), title('Z-plane zero-pole plot'), grid
    xlabel('Re'), ylabel('jIm')
    subplot(4,2,2*i), plot(w,MAGN(:,i)), grid
    xlabel('w (rad)'), title('Normalized Magnitude A(w)')
end