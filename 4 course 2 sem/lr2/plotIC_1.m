function u_out = plotIC_1(b, a, u_in)
    h2 = filter(b, a, u_in);
    N2 = length(u_in);
    figure;
    n = 0:N2-1;
    stem(n,h2(1:N2),'fill','MarkerSize',3), grid;
    xlabel('n'), ylabel('h(n)'), title('ιθ - filter')
    u_out = h2;
end