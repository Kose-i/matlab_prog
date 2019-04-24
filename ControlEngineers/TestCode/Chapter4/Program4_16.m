num = [1, 2, 4];
den = conv(conv([1, 4, 0],[1,6]),[1, 1.4, 1]);
r = rlocus(num, den);
plot(r);v = [-7, 3, -5, 5];axis(v);axis('square')
grid
title('Root-Locus Plot of G(s)=K(s^2+2s+4)/[s(s+4)(s+6)(s^2+1.4s+1)]')
xlabel('Real Axis');ylabel('Imag Axis')
text(1.0, 0.5, 'K=12')
text(1.0, 3.0, 'K=73')
text(1.0, 4.15, 'K=154')
gtext('o') % Place 'o' mark on each of 2 open-loop zeros.
gtext('o')
gtext('x') % Place 'x' mark on each of 5 open-loop poles.
gtext('x')
gtext('x')
gtext('x')
gtext('x')