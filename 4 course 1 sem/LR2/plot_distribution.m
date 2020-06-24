step = 0.1;
c = 6;
z1 = -10:step:-6;
z2 = -6:step:6;
z3 = 6:step:10;
y1 = c^2/6;
y2 = z2.^6/(6*c^4) + z2.^4/(2*c^2) + z2.^2/2;
y3 = c^2/6;
p = plot(z1, y1*ones(1,length(z1)), z2, y2, z3, y3*ones(1,length(z1)));
grid on;
p(1).LineWidth = 1.5;
p(2).LineWidth = 1.5;
p(3).LineWidth = 1.5;
xlabel('z');
ylabel('p');

