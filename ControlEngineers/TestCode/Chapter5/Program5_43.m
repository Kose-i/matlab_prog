num1 = [40, 24, 3.2];
den1 = [1, 9.02, 24.18, 16.48, 0.32, 0];
bode(num1, den1)
grid
title('Bode Diagram of Gc(s)G(s)')
[Gm,Pm,wcp,wcg] = margin(num1, den1);
GmdB = 20*log10(Gm);
[GmdB, Pm, wcp, wcg]

gtext('Gain margin= 11.92 dB')
gtext('Phase margin= 50.68 degrees')
