% Determination of transfer function of observer controller -- full-order observer

A = [0, 1;0, -2];
B = [0;4];
C = [1, 0];
K = [4, 0.5];
Ke = [14;36];

[num, den] = ss2tf(A-Ke*C-B*K,Ke,K,0)
