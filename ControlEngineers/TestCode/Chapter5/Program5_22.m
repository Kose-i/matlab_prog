num = [100];
den = [1, 7.5, 0];
sys1 = tf(num, den);
sys = feedback(sys1, [1]);
w = logspace(0, 2, 100);
bode(sys, w)
grid
title('Bode Diagram of Closed-Loop System G/(1+G)')
