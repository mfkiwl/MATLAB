function s = f_fix0_extrapolation(t, T, sd)
    N = length(sd);
    M = length(t);
    s = zeros(1,M);
%     temp = [];
    for m=1:M
%         temp = [temp floor(t(m)/T)+1];
        if (floor(t(m)/T)+1 > length(sd))
            ind = length(sd);
        else
            ind = floor(t(m)/T)+1;
        s(m) = sd(ind);
    end
end