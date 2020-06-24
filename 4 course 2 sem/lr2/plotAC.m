function plotAC(H_w, w)
    MAG_w = abs(H_w); % ���
    PHASE_w = angle(H_w); % ���
    figure('Name','Magnitude and Phase Responses','NumberTitle', 'off')
    subplot(2,1,1);
    plot(w,MAG_w), grid;
    xlabel('w (rad)'), title('MAGNITUDE -|�(w)|')
    subplot(2,1,2);
    plot(w,PHASE_w), grid;
    xlabel('w (rad)'), title('PHASE - arg[H(w)] (rad)')
end

