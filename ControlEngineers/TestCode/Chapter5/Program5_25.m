num = [1];
den = [0.5, 1.5, 1, 0];
sys1 = tf(num, den);
sys = feedback(sys1, 1);
w = logspace(-1, 1);
bode(sys, w)
grid
[mag,phase,w] = bode(sys, w);
[Mp, k] = max(mag);
resonant_peak = 20*log10(Mp)

resonant_frequency = w(k)

n=1;
while 20*log(mag(n)) >= -3;n = n+1;end;
bandwith = w(n)
