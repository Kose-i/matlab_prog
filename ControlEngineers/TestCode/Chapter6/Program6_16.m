% Obtaining the characteristic equation

A = [0, 1, 0;0, 0, 1;0, -24, -10];
B = [0;10;-80];
K = [1.25, 1.25, 0.19375];
Aaa = 0;Aab = [1, 0];Aba = [0;0];Abb = [0, 1;-24,-10];
Ba = 0;Bb = [10;-80];
Ka = 1.25;Kb = [1.25, 0.19375];
Ke = [10;-24];

[num1, den1] = ss2tf(A-B*K, eye(3), eye(3), eye(3), 1);
[num2, den2] = ss2tf(Abb-Ke*Aab, eye(2), eye(2), eye(2), 1);
charact_eq = conv(den1, den2)

