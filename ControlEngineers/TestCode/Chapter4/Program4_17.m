num = [1, 1];den = conv([1, -1, 0],[1, 4, 16]);
r = rlocus(num, den);
plot(r, '-');v = [-4, 4, -4, 4];axis(v);axis('square')
grid
title('Root-Locus Plot of G(s)H(s)=K(s+1)/[s(s-1)(s^2+4s+16)]')
xlabel('Real Axis');ylabel('Imag Axis')
text(2, 2.6, 'K=35.7')
text(2, 1.6, 'K=23.3')
text(2, 0.7, 'K=0')
text(-3.5, 3.4, 'K=\infty')
gtext('o') % Place 'o' mark on the open-loop zero.
gtext('x') % Place 'x' mark on each of 4 open-loop poles.
gtext('x')
gtext('x')
gtext('x')