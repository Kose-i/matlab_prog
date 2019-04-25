num = [45, 20, 1];
den = [1, 10, 20, 30, 5, 0];
w = logspace(-3, 2, 300);
nichols(num, den, w);
ngrid
hold
% Current plot held
ww = [1, 3, 10, 100];
[mag, phase, ww] = nichols(num, den, ww);
magdB = 20*log10(mag);
plot(phase, magdB, 'o')
gtext('1')
gtext('3')
gtext('10')
gtext('100')
hold
% Current plot released
sys1 = tf(num, den);
sys = feedback(sys1, [1])

bode(sys, w)
grid
