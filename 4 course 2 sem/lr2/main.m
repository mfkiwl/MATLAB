%% ������� ����������
Nbr = 4;
% 1. ������������ ��������� ������������ �������
b0=0.5 + 0.02*Nbr;
b1=-b0*(0.9822+0.0178*Nbr);
b2=b0*(0.8+0.2*mod(Nbr,5));
b = [b0, b1, b2];
% 2. ������������ ����������� ������������ ������� 
a0=1;
a1=0.7788+0.025*Nbr;
a2=0.64+0.006*Nbr;
a = [a0, a1, a2];
% 3. ����� ��
N1=mod(Nbr, 10)+20;
% 4. ����� �����������
N2=mod(Nbr, 10)+30;
% 5. ������� �������������
Fs=1000*Nbr;

%% ���������� h1 ����� N1 � ������� ������� impz � ������� �������
h1 = impz(b,a,N1); % ���������� �������������� 
n = 0:(N1-1); % ������������� ����� 
figure('Name', '���������� ��������������'); 
subplot(2,1,1);
stem(n,h1,'fill','MarkerSize',3), grid; xlabel('n'), ylabel('h(n)'), title('�� - impz')

%% ���������� h2 � ������� ������� filter � ������� �������
u0 = [1, zeros(1, (N1-1))];
h2 = filter(b, a, u0);
subplot(2,1,2); stem(n,h2,'fill','MarkerSize',3), grid; xlabel('n'), ylabel('h(n)'), title('�� - filter')

%% ���������� ������� y1(n) (������������� y1) �� ������� �������
x = input_1(N2); % ����������� (���������� ������������� �������)
y1 = conv(x,h1); % ������� (����� ����� ����� �������)
% ������� ������� ������ ����������� x1(n) � ��� ������� ������� y1(n)
%� ������ L, ������ ����� ������� L , � ������, ������������ �� ����� �����������.
L = N1+N2-1;
n = 0:(N2-1);
n1 = 0:(L-1);
figure('Name','������� � �������� �������','NumberTitle', 'off')
subplot(4,1,1);
% ����� �������
% ���������� ������������� ����� ��� �����������
% ���������� ������������� ����� ��� �������
stem(n,x,'fill','MarkerSize',3), grid;
xlabel('n'), ylabel('x(n)');
title('������� - ���������� ������������� �������');
subplot(4,1,2);
stem(n1,y1,'fill','MarkerSize',3), grid; xlabel('n'), ylabel('y(n)');
title('�������� ������ - conv (length = L)')
subplot(4,1,3);
stem(n,y1(1:N2),'fill','MarkerSize',3), grid;
xlabel('n'), ylabel('y1(n)');
title('�������� ������ y1(n) - conv (length = N2)');
%% ���������� ������� y2(n) �� ����������� ��������� ��� ������ ������� filter
y2 = filter(b,a,x);
subplot(4,1,4);
stem(n,y2,'fill','MarkerSize',3), grid
xlabel('n'), ylabel('y(n)')
title('�������� ������ y2(n) - filter (length = N2)');
%% �� � ���� ������������ ���������� ����������
[q,p,K] = tf2zpk(b,a); % ���� (q) � ������ (p) � �������������� ����� � ����������� �������� (K)
rq = abs(q); % ������ ���������� ����������� �����
wq = angle(q); % ��������� ���������� ����������� ����� %
rp = abs(p); % ������ ���������� ����������� ������� 
wp = angle(p) % ��������� ���������� ����������� �������
%% �� � ���� ������������ ���������� ������� ������� 
[s,G] = tf2sos(b,a) % ������������ (s) � ����������� �������� (G)
%% �� � ���� ����� ������� ������
[r,p,c] = residuez(b,a); % ������������ ���������� (r) � ������ (p)
% � �������������� ����� � ����� ����� (c) (c)
rr = abs(r); % ������ ����������-����������� ������������� ���������� 
wr = angle(r); % ��������� ���������� ����������� �������������
%% ����� ����� ����� � �������.
figure('Name',' Z-plane zero-pole plot','NumberTitle', 'off');
zplane(b,a), title('Z-plane zero-pole plot'), grid
xlabel('Re'), ylabel('jIm')
%% ���������� ��� � ��� � ����� ������������� ������.
w = 0:pi/100:pi; % ������ ������������� ������ (���)
H_w = freqz(b,a,w); % ����������� ����������� ��������
MAG_w = abs(H_w); % ���
PHASE_w = angle(H_w); % ���
figure('Name','Magnitude and Phase Responses','NumberTitle', 'off')
subplot(2,2,1);
plot(w,MAG_w), grid;
xlabel('w (rad)'), title('MAGNITUDE -|�(w)|')
subplot(2,2,3);
plot(w,PHASE_w), grid;
xlabel('w (rad)'), title('PHASE - arg[H(w)] (rad)')
%% ���������� ��� � ��� � ����� ���������� ������.
f = 0:Fs/100:Fs/2; % ������ ���������� ������
H = freqz(b,a,f,Fs); % ����������� ����������� ��������
MAG = abs(H); % ���
PHASE = angle(H); % ���
subplot(2,2,2);
plot(f,MAG), grid, xlabel('f (Hz)'), title('MAGNITUDE - |�(f)|')
subplot(2,2,4);
plot(f,PHASE), grid, xlabel('f (Hz)'), title('PHASE - arg [H(f)] (rad)')
%% ������ ������� ����� � ������� �� ��� ���.
b(1,:) = [1 0 0];
b(2,:) = [1 0 0];
b(3,:) = [1 0 0];
b(4,:) = [1 1 0];
a(1,:) = a;
a(2,:) = [1 -a(1,2) a(1,3)];
a(3,:) = [1 a(1,2) 1.2*a(1,3)];
a(4,:) = [1 a(1,2) a(1,3)];
w = 0:pi/100:pi; % ������ ������������� ������ (���) 
for i=1:4
    H3(:,i) = freqz(b(i,:),a(i,:),w); % ��������� �������������� - i-� ������� �������
    MAG3(:,i) = abs(H3(:,i)); MAX(:,i) = max(MAG3(:,i)); % ��� - i-� ������� ������� - � �������� ���
    MAGN(:,i) = MAG3(:,i)/MAX(:,i); % ������������� ��� - i-� ������� �������
end
figure('Name','Z-plane zero-pole plots and Normalized Magnitudes','NumberTitle', 'off')
for i = 1:4
    subplot(4,2,2*i-1), zplane(b(i,:),a(i,:)), title('Z-plane zero-pole plot'), grid
    xlabel('Re'), ylabel('jIm')
    subplot(4,2,2*i), plot(w,MAGN(:,i)), grid
    xlabel('w (rad)'), title('Normalized Magnitude A(w)')
end