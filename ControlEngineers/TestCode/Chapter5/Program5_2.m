num = [9, 1.8, 9];
den = [1, 1.2, 9, 0];
bode(num, den)
grid
title('Bode Diagram of G(s)=9(s^2+0.2s+1)/[s(s^2+1.2s+9)]')