num = [1, 0, 25, 0];
den = [1, 0, 404, 0, 1600];
K = 0:0.4:1000;
r = rlocus(num, den, K);
plot(r, 'o')
v = [-30, 20, -25, 25];axis(v);axis('square')
grid
title('Root-Locus Plot of G(s)=K(s^2+25)s/(s^4+404s^2+1600)')
xlabel('Real Axis');ylabel('Imag Axis')