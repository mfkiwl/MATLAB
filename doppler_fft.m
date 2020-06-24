clc
clear all

dist0 = 3;
v = 5;
angle = -7 / 180 * pi;
Tc = 40 * 10^-6;
fv = 2 * pi / 3;

startFreq = 77*10^9;
endFreq = 81*10^9;
S = (endFreq - startFreq) / Tc;
c = 3 * 10^8;
lambda = c / startFreq;
d = lambda / 2;

[range_cube, doppler_cube] = gen_doppler_fft_cube(dist0, v);
[doppler_fft_size, range_fft_size] = size(range_cube);

figure (4)
w = 2 * pi * ((-doppler_fft_size/2):(doppler_fft_size/2-1)) / doppler_fft_size;
vel = lambda * w / (4 * pi * Tc);
f = 1:1:range_fft_size;
dist = f * c / (2 * S * Tc);
[x,y] = meshgrid(dist,vel);

surf(x,y,abs(doppler_cube));
xlabel('Дальность [м]');
ylabel('Скорость [м/с]');