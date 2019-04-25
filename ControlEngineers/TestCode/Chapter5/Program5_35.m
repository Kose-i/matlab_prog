% ***** Unit-ramp responses *****

num1 = [10];
den1 = [1, 1, 10, 0];
num2 = [95.238, 283.6854];
den2 = [1, 15.1842, 109.4222, 283.6854, 0];
t = 0:0.01:3;
[c1, x1, t] = step(num1, den1, t);
[c2, x2, t] = step(num2, den2, t);
plot(t, c1, '.', t, t, '--')
grid
title('Unit-Ramp Responses of Compensated and Uncompensated Systems')
xlabel('t (sec)')
ylabel('Outputs')
text(0.1, 1.3, 'Compensated system')
text(1.2, 0.65, 'Uncompensated system')
