% Root-Locus Plot

num = [1, 4, 4];
den = [1, 10, 29, 40, 100];
r = rlocus(num, den);
plot(r, 'o')
v = [-8, 4, -6, 6];axis(v);axis('square')
hold
current plot held
plot(r,'-')
grid
title('Root-Locus Plot of G(s)=(s+2)^2/[(s^2+4)(s+5)^2]')
xlabel('Real Axis')
ylabel('Imag Axis')