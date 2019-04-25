% Obtaining the state feedback gain matrix K

A = [0, 1, 0;0, 0, 1;0, -24, -10];
B = [0;10;-80];
C = [1, 0, 0];
J = [-1+j*2, -1-j*2, -5];
K = acker(A,B,J)

% Obtaining the observer gain matrix Ke

Aaa = 0;Aab = [1, 0];Aba = [0, 0];Abb = [0, 1;-24, -10];Ba = 0;Bb = [10;-80];
L = [-10, -10];
Ke = acker(Abb', Aab', L)'
