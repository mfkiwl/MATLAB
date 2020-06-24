xy = [10;10];
sigma_vector = [0.2, 0.4, 0.6, 0.8, 1.0];
K = length(sigma_vector);
mean_e_vector = zeros(2,K);
mean_m_vector = zeros(2,K);
cov_e_vector = zeros(1,K);
cov_m_vector = zeros(1,K);
sigma_x_vector = zeros(2, K);
sigma_y_vector = zeros(2, K);
for j=1:K
    %% initial data
    R1 = diag([2,sigma_vector(j)]);
    R2 = diag([sigma_vector(j),2]);
    N = 1000;
    eXY = zeros(2,N);
    mXY = zeros(2,N);
    z1 = zeros(2,N);
    z2 = zeros(2,N);
    sum_e = 0;
    sum_m = 0;
    cov_e = 0;
    cov_m = 0;
    %% means
    for i=1:N
        z1(:,i) = [xy(1)+randn*R1(1,1); xy(2)+randn*R1(2,2)];
        z2(:,i) = [xy(1)+randn*R2(1,1); xy(2)+randn*R2(2,2)];
        P = inv(inv(R1) + inv(R2));
        eXY(:,i) = z1(:,i) + P/R2*(z2(:,i) - z1(:,i)); %unscented method?
        mXY(:,i) = (z1(:,i)+z2(:,i))/2; %mean method
        sum_e = eXY(:,i) + sum_e;
        sum_m = mXY(:,i) + sum_m;
    end

    mean_e = sum_e/N;
    mean_m = sum_m/N;

    %% covariation
    for i=1:N
        cov_e = cov_e + [eXY(:,i)-mean_e]*[eXY(:,i)-mean_e]';
        cov_m = cov_m + [mXY(:,i)-mean_m]*[mXY(:,i)-mean_m]';
    end

    cov_e = cov_e/N;
    cov_m = cov_m/N;
    
    %% insert into vector
    mean_e_vector(:, j) = mean_e;
    mean_m_vector(:, j) = mean_m;
    sigma_e_vector(:, j) = [cov_e(1,1), cov_e(2,2)];
    sigma_m_vector(:, j) = [cov_m(1,1), cov_m(2,2)];
    
 %% plots
%     figure;
%     scatter(z1(1,:), z1(2,:),'.b');
%     hold on;
%     grid on;
%     scatter(z2(1,:), z2(2,:),'.g');
%     scatter(eXY(1,:), eXY(2,:),'.r');
%     plot(xy(1),xy(2),'*b');
%     axis([0,20,0,20]);
%     figure;
%     scatter(z1(1,:), z1(2,:),'.b');
%     hold on;
%     grid on;
%     scatter(z2(1,:), z2(2,:),'.g');
%     scatter(mXY(1,:), mXY(2,:),'.r');
%     plot(xy(1),xy(2),'*');
%     axis([0,20,0,20]);
end
%% plots of mean and sigma estimates of x and y
figure;
plot(sigma_vector, mean_e_vector(1, :), sigma_vector, mean_m_vector(1, :));
legend('unscented estimate', 'arithmetic mean estimate');
xlabel('sigma');
ylabel('x coord estimate');
grid on;
figure;
plot(sigma_vector, mean_e_vector(2, :), sigma_vector, mean_m_vector(2, :));
legend('unscented estimate', 'arithmetic mean estimate');
ylabel('y coord estimate');
grid on;
figure;
plot(sigma_vector, sigma_e_vector(1, :), sigma_vector, sigma_m_vector(1, :));
legend('unscented estimate', 'arithmetic mean estimate');
ylabel('sigma x estimate');
grid on;
figure;
plot(sigma_vector, sigma_e_vector(2, :), sigma_vector, sigma_m_vector(2, :));
legend('unscented estimate', 'arithmetic mean estimate');
ylabel('sigma y estimate');
grid on;
saveas(figure(1), '1.png');
saveas(figure(2), '2.png');
saveas(figure(3), '3.png');
saveas(figure(4), '4.png');



