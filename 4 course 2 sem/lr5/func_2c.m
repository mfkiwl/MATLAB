function [input, reaction] = func_2c(b, Fs, A1, A2, f1, f2)
    w1 = 2*pi*f1/Fs; w2 = 2*pi*f2/Fs; % מןעםיעןקבממשו ‏בףפןפש היףכעופמשט חבעםןמיכ (עבה)
    N = 64;
    n = 0:(N-1);
    x = A1*cos(w1*n)+A2*cos(w2*n);
    figure('Name','Periodic Sequence','NumberTitle','off')
    subplot(3,1,1), stem(n,x, 'MarkerSize',3,'Linewidth',2)
    grid, xlabel('n')
    ylabel('x(n)'), title(strcat(['Periodic Sequence x(n) N = ',num2str(N)]))
    a = 1;
    h = filter(b, a, x);
    subplot(3,1,2); stem(0:length(b)-1,b,'fill','MarkerSize',3), grid; xlabel('k'), ylabel('b(k)'), title(strcat(['כ-װÙ נז ֶֹּ״װֱׂ (b), k = ',num2str(length(b))]))
    subplot(3,1,3); stem(n,h,'fill','MarkerSize',3), grid; xlabel('n'), ylabel('reaction')
    input = x;
    reaction = h;
end

