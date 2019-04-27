% -- Design of quadratic optimal regulator system --

A = [0, 1, 0;0, 0, 1;-35, -27, -9];
B = [0;0;1];
Q = [1, 0, 0;0, 1, 0;0, 0, 1];
R = [1];
[K,P,E] = lqr(A,B,Q,R)
