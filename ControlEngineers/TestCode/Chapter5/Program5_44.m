% ***** Unit-step response *****

num = [40, 24, 3.2];
den = [1, 9.02, 24.18, 56.48, 24.32, 3.2];
t = 0:0.2:40;
step(num, den, t)
grid
title('Unit-Step Response of Compensated System')
