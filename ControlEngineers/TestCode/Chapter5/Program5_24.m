num = [20, 20];
den = conv([1, 5, 0], [1, 2, 10]);
sys = tf(num, den);
w = logspace(-1, 2, 100);
bode(sys, w)
[Gm,Pm,wcp,wcg] = margin(sys);
GmdB = 20*log10(Gm)
[GmdB, Pm, wcp, wcg]
