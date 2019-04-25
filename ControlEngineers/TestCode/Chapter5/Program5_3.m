num = [9, 1.8, 9];
den = [1, 1.2, 9, 0];
w = logspace(-2, 3, 100);
bode(num, den, w)
grid
title('Bode Diagram of G(s)=9(s^2+0.2s+1)/[s(s^2+1.2s+9)]')