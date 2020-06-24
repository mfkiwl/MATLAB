function A = make_A(r, r_repers, n)
    %UNTITLED16 Summary of this function goes here
    %   Detailed explanation goes here
    A = zeros(n, 2);
    for i=1:n
        A(i,:) = d_s_one(r, r_repers, i);
    end
end

