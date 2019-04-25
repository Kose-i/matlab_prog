num = [4];
den = [1, 0.00000000001, 1, 0];
w = logspace(-1, 1, 200);
bode(num, den, w)
grid
title('Bode Diagram of 4/[s(s^2+1)]')
