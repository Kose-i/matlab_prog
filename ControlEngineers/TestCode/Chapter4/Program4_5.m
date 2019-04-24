num = [1];
den = [1, 3, 2, 0];
numa = [1];
dena = [1, 3, 3, 1];
K1 = 0:0.1:0.3;
K2 = 0.3:0.005:0.5;
K3 = 0.5:0.5:10;
K4 = 10:5:100;
K = [K1, K2, K3, K4];
r = rlocus(num, den, K);
a = rlocus(numa, dena, K);
y = [r, a];
plot(y, '-')
v = [-4, 4, -4, 4];axis(v)
grid
title('Root-Locus Plot of G(s)=K/[s(s+1)(s+2)] and Asymptotes')
xlabel('Real Axis');ylabel('Imag Axis')
gtext('x') % Place 'x' mark on each of 3 open-loop poles
gtext('x')
gtext('x')