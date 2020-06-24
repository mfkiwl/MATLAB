function u_1 = input_2(Nbr, N2)
    n_0 = mod(Nbr, 5) + 3;
    n_imp = mod(Nbr, 5) + 3;
    U = Nbr;
    u_1 = zeros(1, N2);
    for i=0:N2-1
        if i > n_0 && i < n_0 + n_imp - 1
            u_1(i+1) = U;
        else
            u_1(i+1) = 0; 
        end
    end
end