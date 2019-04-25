numc = [9.5238, 28.3685];
denc = [1, 14.1842];
w = logspace(-1,3,100);
bode(numc, denc, w)
grid
title('Bode Diagram of G(s)=9.5238(s+2.9787)/(s+14.1842)')
