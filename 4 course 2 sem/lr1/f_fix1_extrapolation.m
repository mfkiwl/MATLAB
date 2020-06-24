function s = f_fix1_extrapolation(t, T, sd)
    M = length(t);
    s = zeros(1,M);
    for m=1:M
        
        n_ = floor(t(m)/T);
        n = n_ + 1;
        if (n > length(sd))
            n = length(sd);
            n_ = length(sd);
        end
        if n_ == 0
            s(m) = sd(1);
        else
            s(m) = sd(n) + (t(m)/T - n_)*(sd(n) - sd(n_));
        end
    end
end