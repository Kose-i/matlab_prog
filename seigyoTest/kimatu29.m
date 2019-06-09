mol = [1, 1];
den = [1, 1, -3];
K = 0:0.01:1000;
r = rlocus(mol, den, K);
plot(r, '-');v = [-5, 5, -5, 5];axis(v);axis('square')
