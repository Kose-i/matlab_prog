num = [20];
den = [1, 1, 0];
w = logspace(0, 1, 100);
bode(num, den, w)
grid
title('Bode Diagram of G1(s)=20/[s(s+1)]')
