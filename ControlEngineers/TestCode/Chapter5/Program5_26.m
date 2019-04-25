num = [10, 1];
den = [1, 1.5, 0.5, 0];
bode(num, den)
grid
title('Bode Diagram of G(s)=(10s+1)/[s(s+0.5)(s+1)]')
