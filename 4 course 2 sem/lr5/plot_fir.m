function plot_fir(R,b,Fs)
% ����� �������� ��, ��� � ��� ���-������� 
%
% R ? ������� ���-�������
% b ? ������ ������������� ���-������� (�� ���-�������)
% Fs ? ������� ������������� (��)
%
% a = [1] ? ����������� ����������� ������������ �������
% n ? ������ ����������� �������������� �������
% f ? ����� ������ (��) ��� ������� ��� � ���
% H ? ��������� ��������������
% MAG � PHASE ? ��� � ��� 
%
a = [1];
n = 0:R;
subplot(3,1,1), stem(n,b,'fill','MarkerSize',3) 
xlabel('n'), title('Impulse Response'), grid
f = 0:((Fs/2)/1000):Fs/2;
H = freqz(b,a,f,Fs);
MAG = abs(H);
PHASE = angle(H);
subplot(3,1,2), plot(f,MAG)
xlabel('f (Hz)'), title('MAGNITUDE'), grid 
subplot(3,1,3), plot(f,PHASE)
xlabel('f (Hz)'), title('PHASE'), grid