num = [80];
den = [1, 14, 40, 0];
w = logspace(-1, 1, 100);
nichols(num, den, w);
ngrid;
title('Nichols Plot');
text(-160, -30, 'G(j\omega) locus')
