clf % Clear figure
num = [1, 3];den = [1, 5, 20, 16, 0];
r = rlocus(num, den);
plot(r,'-');v = [-6, 6, -6, 6];axis(v);axis('square')
grid
title('Root-Locus Plot of G(s)=K(s+3)/[s(s+1)(s^2+4s+16)]')
xlabel('Real Axis');ylabel('Imag Axis')
gtext('o') % Place 'o' mark on the open-loop zero.
gtext('x') % Place 'x' mark on each of 4 open-loop poles.
gtext('x')
gtext('x')
gtext('x')