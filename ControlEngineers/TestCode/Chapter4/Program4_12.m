num = [1, 2];
den = [1, 9, 8, 0];
K = 0:0.02:200;
r = rlocus(num, den, K);
plot(r,'-');v = [-10, 2, -6, 6];axis(v);axis('square')
sgrid
title('Root-Locus Plot with Constant \zeta Lines and Constant \omega_n Circles')
xlabel('Real Axis')
ylabel('Imag Axis')
gtext('o') % Place 'o' mark on the open-loop zero.
gtext('x') % Place 'x' mark on 3 open-loop poles.
gtext('x')
gtext('x')