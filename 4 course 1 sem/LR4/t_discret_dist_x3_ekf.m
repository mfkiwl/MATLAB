% -----------------------------------------------------------------------------------
% ?оделирование сопровождени? низкоскоростной цели
% (расширенный фильтр  алмана)
% -----------------------------------------------------------------------------------

% ?екуща? дальность до цели (как функци? времени)

dist = @(t, D0, V) D0 + V.*t + 0.0*t.^2; 

% -----------------------------------------------------------------------------------

% ?ункци? модели преобразовани? состо?ни?

f = @(x, dT) [x(1,:) + dT*x(2,:); x(2,:); max(min(x(3,:),1.0),0)];
% f = @(x, dT) [x(1,:) + dT*x(2,:); x(2,:); x(3,:)];

% -- якобиан модели состо?ни?
Df = @(x, dT) [1 dT 0; 0 1 0; 0 0 1];

% ?ункци? модели измерений

h3_ = @(D_, D, K) D_ + (D-D_).*K;  
h3 = @(x, dD) h3_((floor(x(1,:)/dD)+0.5)*dD, x(1,:), x(3,:));

% -- якобиан модели измерений

Dh = @(x, dD) [x(3,:) 0 x(1,:)-(floor(x(1,:)/dD)+0.5)*dD];

% ?обственно моделирование
% -----------------------------------------------------------------------------------

% ?сходные данные

dT     = 0.1;      % - период поступлени? данных, с
T_max  = 50;       % - интервал моделировани?, с

D0     = 10000;    % - начальна? дальность до цели, м
V      = -5;     % - скорость цели, м/c

dD     = 60;

Sr_true = 0.8;   % - истинное ? ? шумов измерений
Sr_filt = 9.0;   % - ? ? шумов измерений, используемое в фильтре
Sq_filt = 0.7;   % - ? ? возмущений дальности, используемое в фильтре
Sv_filt = 0.03;  % - ? ? возмущений поправочного коэффициента измерител?

N       = 100;      % - число прогонов моделировани?

global H_DISCRET_DIST_CORRECT H_DISCRET_DIST_ALG;
H_DISCRET_DIST_CORRECT = 0;
H_DISCRET_DIST_ALG = 1;

fprintf('расчет начат...\n');

% ?асчет посто?нных величин

t   = [0:dT:T_max];      % - массив моментов времени дискретизации
D   = dist(t,D0,V);      % - массив дальностей

K = length(t)-1;
Izm_mean = zeros(1, K);
Izm_kvad = zeros(1, K);
Est_mean = zeros(3, K);
Est_kvad = zeros(3, K);
Est_max  = zeros(3, K);

for i=1:N
  
  % инициализаци? массивов и фильтра
  izm0 = h_discret_dist2(D(1), dD, Sr_true);
  Izm  = h_discret_dist2(D(2:K+1), dD, Sr_true);
  x   = [Izm(1); 0; 0.8];
  P   = diag([Sr_filt^2 5^2 0.3^2]);
  Est = zeros(3, K);
  Cov = cell(1, K);
  Est(:,1) = x;
  Cov{1} = P;
  % >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
%   figure
%   plot_cov(P(1:2,1:2), x(1:2), '-c');
%   hold on
%   plot_cov(9*P(1:2,1:2), x(1:2), '-c');
%   scatter(D(1), V, '+r');
%   scatter(x(1), x(2), '*b');
%   hold off
%   axis([D(1)-50 D(1)+50 V-20 V+20]);
%   title([num2str(t(1)) ' : ' num2str(Est(3,1))]);
%   drawnow
  %<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  for n=2:K

    % очередной шаг вычислений
    R = Sr_filt^2;
    Q = diag([1E-20 Sq_filt^2*dT^2 Sv_filt^2]);
    [x P] = EKF(x, P, Izm(:,n), f, dT, Df, dT, h3, dD, Dh, dD, Q, R);
    Est(:, n) = x;
    Cov{n} = P;
    % >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
%     plot_cov(P(1:2,1:2), x(1:2), '-c');
%     hold on
%     plot_cov(9*P(1:2,1:2), x(1:2), ':c');
%     scatter(D(n), V, '+r');
%     scatter(Est(1,n), Est(2,n), '*g');
%     hold off
%     axis([D(n)-50 D(n)+50 V-20 V+20]);
%     title([num2str(t(n)) ' : ' num2str(Est(3,n))]);
%     drawnow
    %<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  end
  
  fprintf('%d\n', i);
  Izm_mean = Izm_mean + Izm - D(2:K+1);
  Izm_kvad = Izm_kvad + (Izm - D(2:K+1)).^2;
  Est_mean(1,:) = Est_mean(1,:) + Est(1,:) - D(2:K+1);
  Est_kvad(1,:) = Est_kvad(1,:) + (Est(1,:) - D(2:K+1)).^2;
  Est_max(1,:)  = max(Est_max(1,:), abs(Est(1,:) - D(2:K+1)));
  Est_mean(2,:) = Est_mean(2,:) + Est(2,:) - V*ones(1,K);
  Est_kvad(2,:) = Est_kvad(2,:) + (Est(2,:) - V*ones(1,K)).^2;
  Est_max(2,:)  = max(Est_max(2,:), abs(Est(2,:) - V*ones(1,K)));
  Est_mean(3,:) = Est_mean(3,:) + Est(3,:);
  Est_kvad(3,:) = Est_kvad(3,:) + Est(3,:).^2;
 
end

Izm_mean = Izm_mean./N;
Izm_kvad = Izm_kvad./N - Izm_mean.^2;
Est_mean = Est_mean./N;
Est_kvad = Est_kvad./N - Est_mean.^2;

fprintf('...расчет окончен\n');

figure
subplot(2, 1, 1);
hold on;
% plot(D, 0*h_true.*ones(1, length(t)),'-r');
plot(t(2:K+1), Est_mean(1,:), '-b');
plot(t(2:K+1), Est_mean(1,:) + sqrt(Est_kvad(1,:)), '--m');
plot(t(2:K+1), Est_mean(1,:) - sqrt(Est_kvad(1,:)), '--m');
plot(t(2:K+1), Izm_mean(1,:), '-c');
xlabel('x');
% ylabel('
legend('Estimated mean', 'est_mean + sigma', 'est_mean - sigma', 'measure_mean');
title('coord');
hold off;
grid on;
subplot(2, 1, 2); 
hold on;
% plot(D, 0*r_true.*ones(1, length(t)), '-r');
grid on;
plot(t(2:K+1), Est_mean(2,:), '-b');
plot(t(2:K+1), Est_mean(2,:) + sqrt(Est_kvad(2,:)), '--m');
plot(t(2:K+1), Est_mean(2,:) - sqrt(Est_kvad(2,:)), '--m');
legend('Estimated mean', 'est_mean + sigma', 'est_mean - sigma', 'measure_mean');
title('velocity');
hold off;
grid on;
name = sprintf('EKF_sigma_noise_%.2f_1.png', Sr_true);
saveas(figure(1), name);
figure
subplot(2, 1, 1);
hold on
plot(t(2:K+1), sqrt(Izm_kvad(1,:) + Izm_mean(1,:).^2), '-b');
plot(t(2:K+1), sqrt(Est_kvad(1,:) + Est_mean(1,:).^2), '-r');
plot(t(2:K+1), Est_max(1,:), '-m');
legend('sqrt(measure power + measure mean square)',...
    'sqrt(estimate power + estimate mean square)', 'estimate maximum');
title('coord');
hold off
grid on;
subplot(2, 1, 2);
hold on
plot(t(2:K+1), sqrt(Est_kvad(2,:) + Est_mean(2,:).^2), '-r');
plot(t(2:K+1), abs(V)*ones(1,K), '-b');
plot(t(2:K+1), Est_max(2,:), '-m');
legend('sqrt(estimate power + measure mean square)',...
    'abs of noise in filter', 'estimate maximum');
title('velocity');
hold off
grid on;
name = sprintf('EKF_sigma_noise_%.2f_2.png', Sr_true);
saveas(figure(2), name);
