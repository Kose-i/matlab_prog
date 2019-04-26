% Obtaining matrices K and Ke.

A = [0, 1;0, -2];
B = [0;4];
C = [1, 0];
J = [-2+j*2*sqrt(3), -2-j*2*sqrt(3)];
L = [-8, -8];
K = acker(A,B,J)

Ke = acker(A',C',L)'
