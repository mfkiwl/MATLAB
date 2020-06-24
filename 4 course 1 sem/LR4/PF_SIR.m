function [X, W] = PF_SIR(X, W, z, F, F_param, H, H_param, Q, R)

% [X, W] = PF_SIR(X, W, z, F, F_param, H, H_param, Q, R)
%
% ?еализует один шаг Particle Filter на основе алгоритма SIR
% ?араметры:
%   X       - распределение выборочных точек оцениваемого процесса
%   W       - множество весов
%   z       - очередное измерение
%   F       - функци? модели оцениваемого процесса
%   F_param - набор дополнительных параметров функции модели процесса
%   H       - функци? модели измерени?
%   H_param - набор дополнительных параметров функции модели измерени?
%   Q       - ковариационна? матрица возмущений процесса
%   R       - ковариазионна? матрица шумов измерений

  global PF_PARAM_N_EFF_THRESH PF_PARAM_RESAMPLING_ALG;
  
  n_thr = 0.777;
  if ~isempty(PF_PARAM_N_EFF_THRESH)
    n_thr = PF_PARAM_N_EFF_THRESH;
  end
  
  n_res_alg = 2;
  if ~isempty(PF_PARAM_RESAMPLING_ALG)
    n_res_alg = PF_PARAM_RESAMPLING_ALG;
  end

  % Ёкстрапол?ци? выборочного распределени?
  [n N] = size(X);
  Q_sqrt = chol(Q);
  X = F(X, F_param) + Q_sqrt'*randn(n, N);

  %  оррекци? весов
  R_inv  = inv(R);
  Dz = diag(z)*ones(length(z),N) - H(X, H_param);
%   R_sqrt = chol(R);
%   Dz = diag(z)*ones(length(z),N) - H(X, H_param) + R_sqrt'*randn(length(z),N);
  for k=1:N
    W(k) = W(k)*exp(-0.5*Dz(:,k)'*R_inv*Dz(:,k));
%     W(k) = W(k)*(exp(-0.5*Dz(:,k)'*R_inv*Dz(:,k))+0.1);
%     W(k) = W(k)/((Dz(:,k)'*R_inv*Dz(:,k)) + 1);
%     W(k) = W(k)/((Dz(:,k)'*R_inv*Dz(:,k)) + 1)^2;
%     W(k) = W(k)/sqrt(Dz(:,k)'*R_inv*Dz(:,k) + 1);
%     W(k) = exp(-0.5*Dz(:,k)'*R_inv*Dz(:,k));
  end
%   for k=1:N
%     Dz = z - H(X(:,k), H_param) + R_sqrt'*randn(length(z),1);
%     W(k) = W(k)*exp(-0.5*Dz'*R_inv*Dz);
%   end
  SW = sum(W);
  W = W/SW;
  
  %  оррекци? выборки при необходимости
  n_eff = 1/(sum(W.^2));
  if n_eff < n_thr*N
%     fprintf('n_eff = %g, resampling...\n', n_eff/N);
    if n_res_alg == 1
      [X, W, I] = PF_resample(X, W);
    else
      [X, W, I] = PF_resample2(X, W);
    end
  end

end