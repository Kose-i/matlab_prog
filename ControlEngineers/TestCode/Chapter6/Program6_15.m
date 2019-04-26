% Determination of transfer function of observer controller

A = [0, 1, 0;0, 0, 1;0, -24, -10];
B = [0;10;-80];
Aaa = 0;Aab = [1, 0];Aba = [0;0];Abb = [0, 1;-24,-10];
Ba = 0;Bb = [10;-80];
Ka = 1.25;Kb = [1.25, 0.19375];
Ke = [10;-24];
Ahat = Abb - Ke*Aab;
Bhat = Ahat*Ke + Aba - Ke*Aaa;
Fhat = Bb - Ke*Ba;
Atilde = Ahat - Fhat*Kb;
Btilde = Bhat - Fhat*(Ka + Kb*Ke);
Ctilde = -Kb;
Dtilde = - (Ka + Kb*Ke);
[num, den] = ss2tf(Atilde, Btilde, -Ctilde, -Dtilde)
