num = [1];
den = [1, 6, 8, 0];
K = 0:0.01:1000;
r = rlocus(num, den, K);
plot(r, '-');v = [-5, 5, -5, 5];axis(v);axis('square')
