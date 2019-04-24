num = [1];
den = [1, 4, 5, 0];
K = 0:0.01:1000;
r = rlocus(num, den, K);
plot(r, '-');v = [-3, 1, -2, 2];axis(v);axis('square')
sgrid([0.5, 0.707], [0.5, 1, 2])
grid
title('Root-Locus Plot with \zeta=0.5 and 0.707 Lines and \omega_n=0.5,1,and 2 Circles')
xlabel('Real Axis');ylabel('Imag Axis')
gtext('\omega_n=2')
gtext('\omega_n=1')
gtext('\omega_n=0.5')
gtext('x') % Place 'x' mark at each of 3 open-loop poles.
gtext('x')
gtext('x')