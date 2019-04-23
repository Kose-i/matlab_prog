t = 0:0.01:8;
num = [2, 10];
den = [1, 2, 10];
sys = tf(num, den);
step(sys, t)
grid
title('Unit-Step Response', 'Fontsize', 20')
xlabel('t', 'Fontsize', 20')
ylabel('Output y', 'Fontsize', 20')