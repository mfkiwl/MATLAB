function b1 = func_1c(Fs, ft, fk, d1, d2)
    % Fs - ������� ������������� (��)
    % ft - ��������� ������� �� (��)
    % fk - ��������� ������� �� (��)
    % d1 - ����������� ���������� ���������� � ��
    % d2 - ����������� ���������� ���������� � ��
    pause
    m = [1 0]; % ������ �������� ��������� ���
    f = [ft fk]; % ������ ��������� ������
    ripple = [d1 d2]; % ������ ����������� ���������� ����������
    [R,f0,m0,weight] = firpmord(f,m,ripple,Fs);% ���������� ���������� ������� firpmord
    [b1,error,opt] = firpm(R,f0,m0,weight); % ������������ ���-������� ��� b1 
    disp('R prev')
    R
    while error > max(d1, d2)
        R = R + 1;
        [b1,error,opt] = firpm(R,f0,m0,weight);
    end
    disp('R new')
    R
    figure(1);
    plot_fir(R,b1,Fs)
    figure(2);
    MAG_fir(b1, opt.fextr,f0,m0,Fs)
end

