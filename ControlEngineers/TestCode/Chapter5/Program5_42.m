numc = [1, 0.6, 0.08];
denc = [1, 4.02, 0.08];
bode(numc, denc)
grid
title('Bode Diagram of Lag-Lead Compensator')
