A = [0, 1, 0;0, 0, 1;0, -24, -10];
B = [0;10;-80];
C = [1, 0, 0];
D = [0];
[num, den] = ss2tf(A,B,C,D)