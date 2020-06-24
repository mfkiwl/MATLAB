function b1 = func_1c(Fs, ft, fk, d1, d2)
    % Fs - þáóôïôá äéóëòåôéúáãéé (çÃ)
    % ft - çòáîéþîáñ þáóôïôá ðð (çÃ)
    % fk - çòáîéþîáñ þáóôïôá ðú (çÃ)
    % d1 - íáëóéíáìøîï äïðõóôéíïå ïôëìïîåîéå ÷ ðð
    % d2 - íáëóéíáìøîï äïðõóôéíïå ïôëìïîåîéå ÷ ðú
    pause
    m = [1 0]; % ×ÅËÔÏÒ ÚÎÁÞÅÎÉÊ ÉÄÅÁÌØÎÏÊ áþè
    f = [ft fk]; % ×ÅËÔÏÒ ÇÒÁÎÉÞÎÙÈ ÞÁÓÔÏÔ
    ripple = [d1 d2]; % ÷ÅËÔÏÒ ÍÁËÓÉÍÁÌØÎÏ ÄÏÐÕÓÔÉÍÙÈ ÏÔËÌÏÎÅÎÉÊ
    [R,f0,m0,weight] = firpmord(f,m,ripple,Fs);% ÷ùþéóìåîéå ðáòáíåôòï÷ æõîëãéé firpmord
    [b1,error,opt] = firpm(R,f0,m0,weight); % ëïüææéãéåîôù ëéè-æéìøôòá æîþ b1 
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

