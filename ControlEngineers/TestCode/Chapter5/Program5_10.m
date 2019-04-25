num = [1];
den = [1, 1, 0];
nyquist(num, den)
v = [-2, 2, -5, 5];axis(v)
title('Nyquist Plot of G(s)=1/[s(s+1)]')