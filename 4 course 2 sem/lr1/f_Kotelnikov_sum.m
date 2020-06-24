function s = f_Kotelnikov_sum(t, T, sd)
    wd = pi/T;
    N = length(sd);
    M = length(t);
    s = zeros(1,M);
    for m=1:M
        for n=0:N-1
            x = wd*(t(m) - n*T);
            if x == 0
                s(m) = s(m) + sd(n+1);
            else
                s(m) = s(m) + sd(n+1)*sin(x)/x;
            end 
        end
    end
end