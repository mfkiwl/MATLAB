%исходные данные
r_true = [10000, 10000];
n = 4;
R = 1000;
sigma = 10;
%моделируем измерения
r_repers = calculate_reper_coords(n, R);
temp = make_measure(r_repers, r_true);
s = temp + sigma*randn(n, 1);
q0 = [12000, 8000]; % начальное приближение
fprintf('q0 = [%g,%g]\n', q0(1), q0(2));
k = 10; % число итераций
for i=1:k
    ds = s - make_measure(r_repers, q0);
    A = make_A(q0, r_repers, n);
    dq = inv(A'*A)*A'*ds; %2x4 * 4x1
    q1 = q0 + dq';
    fprintf('q1 = [%g,%g], err = %g\n' , q1(1), q1(2), norm(q1 - r_true));
    q0 = q1; % переход к следующей итерации
end;