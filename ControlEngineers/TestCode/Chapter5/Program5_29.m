numc = [1.01994, 0.26086];
denc = [0.05116, 0.4558, 1, 0,0];
w = logspace(-1, 2, 100);
bode(numc, denc, w)
grid
[Gm,Pm,wcp,wcg] = margin(numc, denc);
GmdB = 20*log10(Gm);
[GmdB, Pm, wcp, wcg]

gtext('Gain margin=17.74 dB')
gtext('Phase margin=49.99 degrees')

% Figure5-50 shows the Bode diagram of the open-loop system (sys1), and Figure5-51 shows that of the closed-loop system (sys).

sys1 = tf(numc, denc);
sys = feedback(sys1, [1])

[mag,phase,w] = bode(sys,w);
[Mr,r] = max(mag);
MrdB = 20*log10(Mr);
wr = w(r);
[MrdB, wr]

gtext('Resonant peak=2.1116 dB')
gtext('Resonant peak frequency=0.6136 rad/sec')

n = 1;
while 20*log10(mag(n)) >-3;n = n+1;end;
Bandwidth = w(n)

gtext('Bandwidth=1.8738 rad/sec')
