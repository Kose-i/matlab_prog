num = [20];
den = [1, 1, 0];
w = logspace(-1, 2, 100);
bode(num ,den, w)
grid
title('Bode Diagram of G1(s)=20/[s(s+1)]')
[Gm,Pm,wcp,wcg] = margin(num,den);
GmdB = 20*log10(Gm)
[GmdB, Pm, wcp, wcg]

gtext('Phase margin=12.8 degrees')
gtext('Gain margin=Inf dB')
