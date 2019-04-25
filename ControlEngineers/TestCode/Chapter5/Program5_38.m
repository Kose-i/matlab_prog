num = [20, 4];
den = [1, 0.00000000001, 1, 0];
w = logspace(-2, 1, 101);
bode(num, den, w)
grid
title('Bode Diagram of G(s)=4/[s(s^2+1)]')
