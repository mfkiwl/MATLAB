function plot_fucking_shit(t, s1_f, s0, s0_f, t1,      F0, F1, f,    s2, s0_cut)

    figure('Position', [50 50 800 500])
    plot(t, s0);
    hold on;
    plot(t, s0_f);
    hold on;
    stem(t1(1:min(length(t1),length(s1_f))), s1_f,'r');
    grid on;
    legend('initial', 'filtered', 'discrete filtered');
    
    figure('Position', [50 50 800 500])
    stem(f, F0(1:length(f)),'b');
    hold on
    stem(f, F1, 'diamondr');
    legend('initial', 'filtered signal');
    grid on

    
    figure('Position', [50 50 800 500])
    subplot(2,1,1);
    hold on;
    plot(t, s0, 'r'); 
    plot(t, s2, 'b');
    legend('initial cutted', 'восстановленный filtered');

    grid on;
    subplot(2,1,2);
    plot(t, s0_cut - s2);
    legend('initial cutted - восстановленный filtered');
    grid on;

end

