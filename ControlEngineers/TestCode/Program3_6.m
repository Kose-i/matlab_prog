%  Unit-Step Response of C(s)/R(s) and Partial-Fraction Expansion of C(s)

num = [3, 25, 72, 80];
den = [1, 8, 40, 96, 80];
step(num, den);
v = [0, 3, 0, 1.2];axis(v),grid

% To obtain the partial-fraction expansion of C(s), enter commands
%   num1 = [3, 25, 72, 80]
%   den1 = [1, 8, 40, 96, 80, 0];
%   [r,p,k] = residue(num1, den1)

num1 = [3, 25, 72, 80];
den1 = [1, 8, 40, 96, 80, 0];
[r,p,k] = residue(num1, den1)