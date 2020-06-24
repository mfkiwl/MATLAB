function [u_out, k] = plotIC(b, a, u_in)
    h2 = filter(b, a, u_in);
    k = 2;
    N2 = length(u_in);
    while abs(abs(h2(k)) - abs(h2(k-1))) > 1e-2 && k < N2+1
        k = k + 1;
    end
    figure;
    n = 0:k-1;
    stem(n,h2(1:k),'fill','MarkerSize',3), grid;
    xlabel('n'), ylabel('h(n)'), title('ιθ - filter')
    u_out = h2;
end

