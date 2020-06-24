function s = make_measure(r_repers, r_true)
    l = length(r_repers(:, 1));
    s = zeros(l, 1);
    c = 3*10^8;
    %k = 1/c;
    for i=1:l
        s(i) = (norm(r_true) + norm(r_true - r_repers(i, :)));
        %s(i) = k*(norm(r_true) + norm(r_true - r_repers(i, :)));
    end
end

