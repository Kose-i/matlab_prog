num = [40];
den = [1, 5, 4, 0];
w = logspace(-1,1,100);
bode(num, den, w)
grid
title('Bode Diagram of G(s)=40/[s(s+1)(s+4)]')
[Gm, Pm, wcp, wcg] = margin(num, den);
% Warning: The closed-loop system is unstable.

GmdB = 20*log10(Gm);
[GmdB, Pm, wcp, wcg]

gtext('Gain margin= -6.02 dB')
gtext('Phase margin= -15.01 degrees')
