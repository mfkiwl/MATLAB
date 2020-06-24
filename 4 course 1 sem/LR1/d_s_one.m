function df = d_s_one(r, r_repers, i)
    x = r(1);
    y = r(2);
    a = r_repers(i, 1);
    b = r_repers(i, 2);
    %c = 3*10^8;
    df_dx = (x/sqrt(x^2 +y^2) - (a - x)/sqrt((a - x)^2 + (b - y)^2));
    df_dy = (x/sqrt(x^2 +y^2) - (b - y)/sqrt((a - x)^2 + (b - y)^2));
    %df_dx = (x/sqrt(x^2 +y^2) - (a - x)/sqrt((a - x)^2 + (b - y)^2))/c;
    %df_dy = (x/sqrt(x^2 +y^2) - (b - y)/sqrt((a - x)^2 + (b - y)^2))/c;
    df = [df_dx, df_dy];
end

