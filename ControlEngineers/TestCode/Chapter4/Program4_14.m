num = [-0.5, 1];
den = [1, 1, 0];
K1 = 0:0.01:30;
K2 = 30:1:100;
K3 = 100:5:500;
K = [K1, K2, K3];
r = rlocus(num, den, K);
plot(r);v = [-2, 6, -4, 4];axis(v);axis('square')
grid
title('Root-Locus Plot of G(s)=K(1-0.5s)/[s(s+1)]')
xlabel('Real Axis');ylabel('Imag Axis')