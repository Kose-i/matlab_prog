% -- Design of quadratic optimal control system --

A = [0, 1, 0;0, 0, 1;0, -2, -3];
B = [0;0;1];
Q = [100, 0, 0;0, 1, 0;0, 0, 1];
R = [0.01];
K = lqr(A,B,Q,R)
