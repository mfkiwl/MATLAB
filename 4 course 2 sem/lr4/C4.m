clc
clear
disp('% �.6. ���������� �������� �������')
x3 = [0 0.25 0.5 0.75 1]; % ������ ������������������
x4 = [0 0.5 1 0.5 0]; % ������ ������������������
y34 = ifft(fft(x3).*fft(x4));% �������� ������� �������������������
L34 = length(y34); % ������ �������� �������
disp('%')
disp('% ��� ������ �������� ������������������� � �������� ������� (3 �������)������� <ENTER>')
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
disp('% ��� ����������� ������� <ENTER>')
pause
disp('%')
disp('% ������ ���������')