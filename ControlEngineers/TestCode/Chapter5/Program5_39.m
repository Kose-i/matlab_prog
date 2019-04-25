num = [5, 21, 4];
den = [1, 0, 1, 0];
w = logspace(-2, 2, 100);
bode(num, den, w)
grid
title('Bode Diagram of 4(5s+1)(0.25s+1)/[s(s^2+1)]')
