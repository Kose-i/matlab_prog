num = [1];
den = [1,0.8,1];
nyquist(num,den)
v = [-2,2,-2,2];axis(v)
title('Nyquist Plot of G(s)=1/(s^2+0.8s+1)')