num = [95.238, 283.6854];
den = [1, 15.1842, 14.1842, 0];
w = logspace(-1, 3, 100);
bode(num, den, w)
grid
title('Bode Diagram of Gc(s)G(s)')
[Gm, Pm, wcp, wcg] = margin(num, den);
GmdB = 20*log10(Gm);
[GmdB, Pm, wcp, wcg]

gtext('Gain margin=Inf dB')
gtext('Phase margin=49.4 degrees')
