% Determination of transfer funtion of observer controller--minimum-order observer

A = [0, 1;0, -2];
B = [0;4];
Aaa = 0;Aab = 1;Aba = 0;Abb = -2;
Ba = 0;Bb = 4;
Ka = 4;Kb = 0.5;
Ke = 6;
Ahat = Abb - Ke*Aab;
Bhat = Ahat*Ke + Aba - Ke*Aaa;
Fhat = Bb - Ke*Ba;
Atilde = Ahat - Fhat*Kb;
Btilde = Bhat - Fhat*(Ka + Kb*Ke);
Ctilde = -Kb;
Dtilde = -(Ka + Kb*Ke);
[num, den] = ss2tf(Atilde, Btilde, -Ctilde, -Dtilde)
