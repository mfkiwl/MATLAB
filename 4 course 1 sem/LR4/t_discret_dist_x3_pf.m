% -----------------------------------------------------------------------------------
% ?оделирование сопровождени? цели при квантовании измерений дальности (PF)
% -----------------------------------------------------------------------------------

% ?екуща? дальность до цели (как функци? времени)

dist = @(t, D0, V) D0 + V.*t + 0.0*t.^2; 

% -----------------------------------------------------------------------------------

% ?ункци? модели преобразовани? состо?ни?

f = @(x, dT) [x(1,:) + dT*x(2,:); x(2,:); max(min(x(3,:),1),0)];
%-- дл? квадратичного дискриминатора
% f = @(x, dT) [x(1,:) + dT*x(2,:); x(2,:); max(min(x(3,:),1.5),0)];
% f = @(x, dT) [x(1,:) + dT*x(2,:); x(2,:); x(3,:)];

% ?ункци? модели измерений

h3_ = @(D_, D, K) D_ + (D-D_).*K;  
h3 = @(X, dD) h3_((floor(X(1,:)/dD)+0.5)*dD, X(1,:), X(3,:));

% ?обственно моделирование
% -----------------------------------------------------------------------------------

% ?сходные данные

dT     = 0.1;      % - период поступлени? данных, с
T_max  = 50;       % - интервал моделировани?, с

D0     = 10000;    % - начальна? дальность до цели, м
V      = -5;       % - скорость цели, м/c

dD     = 60;

Sr_true = 0.4;   % - истинное ? ? шумов измерений
Sr_filt = 9.0;   % - ? ? шумов измерений, используемое в фильтре
Sq_filt = 0.7;    % - ? ? возмущений дальности, используемое в фильтре
Sv_filt = 0.2;   % - ? ? возмущений поправочного коэффициента измерител?

N       = 10;      % - число прогонов моделировани?
M       = 4000;   % - число значений в представл?ющей выборке

global PF_PARAM_N_EFF_THRESH PF_PARAM_RESAMPLING_ALG;
PF_PARAM_N_EFF_THRESH = 0.3;
PF_PARAM_RESAMPLING_ALG = 2;

global H_DISCRET_DIST_CORRECT H_DISCRET_DIST_ALG;
H_DISCRET_DIST_CORRECT = 0;
H_DISCRET_DIST_ALG = 1;

fprintf('расчет начат...\n');

% ?асчет посто?нных величин

t   = [0:dT:T_max];      % - массив моментов времени дискретизации
D   = dist(t,D0,V);      % - массив дальностей

K = length(t);
Izm_mean = zeros(1, K);
Izm_kvad = zeros(1, K);
Est_mean = zeros(3, K);
Est_kvad = zeros(3, K);
Est_max  = zeros(3, K);
N_Ok = 0;
err = [];

for i=1:N
  
  % инициализаци? массивов и фильтра
  Izm  = h_discret_dist2(D, dD, Sr_true);
  % --- генераци? начальной выборки
  X = [Izm(1)+dD/5*randn(1,M); 10*randn(1,M); 0.8+0.2*randn(1,M)];
  W = ones(1,M)/M;
  Est = zeros(3, K);
  Cov = cell(1, K);
  Est(:,1) = X*W';
  X0 = X-Est(:,1)*ones(1,M);
  P = X0*diag(W)*X0';
  Cov{1} = P;

  % >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  if N <= 2
      figure
      scatter(X(1,:), X(2,:), 1);
      hold on
      scatter(D(1), V, '+r');
      scatter(Est(1,1), Est(2,1), '*m');
      plot_cov(P(1:2,1:2), Est(1:2,1), '-c');
      plot_cov(9*P(1:2,1:2), Est(1:2,1), ':c');
      hold off
      axis([D(1)-50 D(1)+50 V-20 V+20]);
      title([num2str(t(1)) ' : ' num2str(Est(3,1))]);
      drawnow
  end
  %<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  Ok = 1;
  for n=2:K

    % очередной шаг вычислений
    R = Sr_filt^2;
    Q = diag([1E-20 Sq_filt^2*dT^2 Sv_filt^2]);
    [X, W] = PF_SIR(X, W, Izm(:,n), f, dT, h3, dD, Q, R);
    % ?роверка результата и формирование результирующих массивов
    if isnan(W(1)) 
      Ok = 0;
      err = [err [i;n]];
      break;
    end
    Est(:, n) = X*W';
    X0 = X-Est(:,n)*ones(1,M);
    P = X0*diag(W)*X0';
    Cov{n} = P;
    % >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    if N <= 2
        if mod(n,1) == 0
          scatter(X(1,:), X(2,:), 1);
          hold on
          scatter(D(n), V, '+r');
          scatter(Est(1,n), Est(2,n), '*m');
          plot_cov(P(1:2,1:2), Est(1:2,n), '-c');
          plot_cov(9*P(1:2,1:2), Est(1:2,n), ':c');
          hold off
          axis([D(n)-50 D(n)+50 V-20 V+20]);
          title([num2str(t(n)) ' : ' num2str(Est(3,n))]);
          drawnow
        end
    end
    %<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  end
  
  fprintf('%d: ', i);
  if Ok == 1
    fprintf('Ok!\n');
    Izm_mean = Izm_mean + Izm - D;
    Izm_kvad = Izm_kvad + (Izm - D).^2;
    Est_mean(1,:) = Est_mean(1,:) + Est(1,:) - D;
    Est_kvad(1,:) = Est_kvad(1,:) + (Est(1,:) - D).^2;
    Est_max(1,:)  = max(Est_max(1,:), abs(Est(1,:) - D));
    Est_mean(2,:) = Est_mean(2,:) + Est(2,:) - V*ones(1,K);
    Est_kvad(2,:) = Est_kvad(2,:) + (Est(2,:) - V*ones(1,K)).^2;
    Est_max(2,:)  = max(Est_max(2,:), abs(Est(2,:) - V*ones(1,K)));
    Est_mean(3,:) = Est_mean(3,:) + Est(3,:);
    Est_kvad(3,:) = Est_kvad(3,:) + Est(3,:).^2;
  else
    fprintf('Failed!\n');
  end
 
end

Izm_mean = Izm_mean./N;
Izm_kvad = Izm_kvad./N - Izm_mean.^2;
Est_mean = Est_mean./N;
Est_kvad = Est_kvad./N - Est_mean.^2;

fprintf('...расчет окончен\n');

figure
subplot(3, 1, 1); 
hold on;
plot(t, Est_mean(1,:), '-b');
plot(t, Est_mean(1,:) + sqrt(Est_kvad(1,:)), '--m');
plot(t, Est_mean(1,:) - sqrt(Est_kvad(1,:)), '--m');
plot(t, Izm_mean(1,:), '-c');
% legend('estimate_mean',...
%     'sqrt(estimate power + estimate mean square)', 'estimate maximum');
% title('coord');
hold off;
grid on;
subplot(3, 1, 2); 
hold on;
plot(t, Est_mean(2,:), '-b');
plot(t, Est_mean(2,:) + sqrt(Est_kvad(2,:)), '--m');
plot(t, Est_mean(2,:) - sqrt(Est_kvad(2,:)), '--m');
hold off;
grid on;
subplot(3, 1, 3); 
hold on;
plot(t, Est_mean(3,:), '-b');
plot(t, Est_mean(3,:) + sqrt(Est_kvad(3,:)), '--m');
plot(t, Est_mean(3,:) - sqrt(Est_kvad(3,:)), '--m');
hold off;
grid on;
name = sprintf('PF_sigma_noise_%.2f_1.png', Sr_true);
saveas(figure(1), name);
figure
subplot(2, 1, 1);
hold on
plot(t, sqrt(Izm_kvad(1,:) + Izm_mean(1,:).^2), '-b');
plot(t, sqrt(Est_kvad(1,:) + Est_mean(1,:).^2), '-r');
plot(t, Est_max(1,:), '-m');
hold off
grid on;
subplot(2, 1, 2);
hold on
plot(t, sqrt(Est_kvad(2,:) + Est_mean(2,:).^2), '-r');
plot(t, abs(V)*ones(1,K), '-b');
plot(t, Est_max(2,:), '-m');
hold off
grid on;
name = sprintf('PF_sigma_noise_%.2f_2.png', Sr_true);
saveas(figure(2), name);
