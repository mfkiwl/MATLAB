function r_repers = calculate_reper_coords(n, R)
    r_repers = zeros(n, 2);
        for i=1:n
            r_repers(i, 1) = R*cos(2*pi*i/n);
            r_repers(i, 2) = R*sin(2*pi*i/n);
            if r_repers(i,1) < 1e-3
                r_repers(i,1) = 0;
            end
            if r_repers(i,2) < 1e-3
                r_repers(i,2) = 0;
            end
        end
end

