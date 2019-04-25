num = [0.782, 0.2];
den = [0.05116, 0.4558, 1, 0, 0];
w = logspace(-1, 1, 100);
bode(num, den, w);
grid
ww = [0.5, 1, 2];
[mag, phase, ww] = bode(num, den, ww);
magdB = 20*log10(mag);
[ww, magdB]
