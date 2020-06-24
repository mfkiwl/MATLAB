%% ������� ���������� ��� ���� ��������
Nbr = 4;
[b_1, a_1, N1_1, N2_1, Fs_1] = CreateFilter(Nbr);
[b_2, a_2, N1_2, N2_2, Fs_2] = CreateFilter(Nbr+1);
%% 1. ���������� h2 � ������� ������� filter � ������� �������
u_input_0 = [1, zeros(1, (N2_1-1))];
[u_out_1, k1] = plotIC(b_1, a_1, u_input_0); % h1
[u_out_2, k2] = plotIC(b_2, a_2, u_out_1); % h2
%% 2. ���������� ������� ���� ����������� ������� �� ������� ������� �� ����������� x(n):
u_input_1 = input_2(Nbr, N2_1);
u_out_1 = conv(u_input_1, u_out_1);
u_out_2 = conv(u_out_1, u_out_2); % conv(input, h)
N2 = 45;
n = 0:(N2-1);
figure('Name','������� � �������� �������','NumberTitle', 'off')
subplot(4,1,1);
stem(n,u_input_1(1:N2),'fill','MarkerSize',3), grid;
xlabel('n'), ylabel('x(n)');
title('������� ������');
subplot(4,1,2);
stem(n,u_out_1(1:N2),'fill','MarkerSize',3), grid; xlabel('n'), ylabel('y(n)');
title('�������� ������ ������� �����- conv (length = N2)')
subplot(4,1,3);
stem(n,u_out_2(1:N2),'fill','MarkerSize',3), grid;
xlabel('n'), ylabel('y1(n)');
title('�������� ������ ������� ����� - conv (length = N2)');
%% 3. ������� �������
u_input_1 = input_2(Nbr, N2_1);
u_out_1 = plotIC_1(b_1, a_1, u_input_1(1:45)); % h1
u_out_2 = plotIC_1(b_2, a_2, u_out_1(1:45)); % h2
%% 4. ���������� ��� ���� ����������� ������� � ����� ������������� ������
w = 0:pi/100:pi; % ������ ������������� ������ (���)
H_w_1 = freqz(b_1,a_1,w); % ����������� ����������� ��������
H_w_2 = freqz(b_2,a_2,w); % ����������� ����������� ��������
H_w = H_w_1.*H_w_2;
plotAC(H_w, w);
plotAC(H_w_1, w);
plotAC(H_w_2, w);
figure('Name',' Z-plane zero-pole plot 1','NumberTitle', 'off');
zplane(b_1,a_1), title('Z-plane zero-pole plot 1'), grid
xlabel('Re'), ylabel('jIm')
figure('Name',' Z-plane zero-pole plot 2','NumberTitle', 'off');
zplane(b_2,a_2), title('Z-plane zero-pole plot 2'), grid
xlabel('Re'), ylabel('jIm')