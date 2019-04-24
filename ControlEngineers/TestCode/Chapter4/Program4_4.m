A = [0, 1, 0;0, 0, 1;-160, -56, -14];
B = [0;1;-14];
C = [1, 0, 0];
D = [0];
K = 0:0.1:400;
r = rlocus(A,B,C,D,K);
plot(r,'-');v = [-20, 20, -20, 20];axis(v)
grid
title('Root-Locus Plot of System Defined in State Space')
xlabel('Real Axis');ylabel('Imag Axis')
gtext('o') % Place 'o' mark on the open-loop zero.
gtext('x') % Place 'x' mark on 3 open-loop poles.
gtext('x')
gtext('x')