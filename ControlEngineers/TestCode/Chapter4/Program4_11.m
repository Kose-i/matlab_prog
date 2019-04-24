num = [1];den = [1, 4, 5, 0];
K1 = 0:0.0001:2;K2 = 2:0.01:1000;K=[K1, K2];
r = rlocus(num, den, K);
plot(r,'-');v = [-3, 1, -2, 2];axis(v);axis('square')
grid
sgrid(0.5, [])
title('Root-Locus Plot and \zeta = 0.5 Lines')
xlabel('Real Axis');ylabel('Imag Axis')
gtext('x') % Place 'x' mark on each of 3 open-loop poles.
gtext('x')
gtext('x')