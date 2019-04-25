% ***** Unit-step response *****

num1 = [10];
den1 = [1, 1, 10];
num2 = [95.238, 283.6854];
den2 = [1, 15.1842, 109.4222, 283.6854];
t = 0:0.01:6;
[c1, x1, t] = step(num1, den1, t);
[c2, x2, t] = step(num2, den2, t);
plot(t,c1,'.', t,c2,'-')
grid
title('Unit-Step Response of Compensated and Uncompensated Systems')
xlabel('t (sec)')
ylabel('Outputs')
text(1.1, 0.5, 'Compensated system')
text(1.7, 1.46, 'Uncompensated system')
