function [y, Py] = f_UT(x, Px, F, F_param, k)
% [y Py] = UT(x, Px, F, F_param, k)
%
% Реализует ансцентное преобразование 'Unscented Transformation'.
% Параметры:
% x
% Px
% F
%     F_param - дополнительные параметры функции преобразования
%     k       - параметр разброса sigma-точек
% XX = U_points(x, P, k);
  n = length(x);
  m = 2*n+1;
  C = chol((n + k)*Px)';
  XX = zeros(n, m);
  XX(:,1) = x;
  for i = 1:n
    d = C(:,i);
    XX(:,i+1)   = x + d;
    XX(:,i+1+n) = x - d;
end
% w  = U_weights(length(x_), k);
  w = zeros(1, m);
  q = k + n;
  w(1) = k / q;
  w(2:m) = 0.5 / q;
% YY = U_transform(XX_, F, F_param);
  y1 = F(XX(:,1), F_param);
  l = length(y1);
  YY = zeros(l,m);
  YY(:,1) = y1;
  for i=2:m
    YY(:,i) = F(XX(:,i), F_param);
end
% y  = U_mean(YY, w);
y = YY * w';
% Py  = U_cov(YY, YY, w);
  Py = zeros(l, l);
  for i=1:m
    Py = Py + w(i)*(YY(:,i)-y)*(YY(:,i)-y)';
  end
end