% Obtaining transfer function of obserer controller-- full-order observer

A = [0, 1;20.6, 0];
B = [0;1];
C = [1, 0];
K = [29.6, 3.6];
Ke = [16;84.6];
AA = A - Ke*C - B*K;
BB = Ke;
CC = K;
DD = 0;
[num, den] = ss2tf(AA,BB,CC,DD)
