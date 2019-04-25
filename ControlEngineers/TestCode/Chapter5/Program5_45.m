% ***** Unit-ramp response *****

num = [40, 24, 3.2];
den = [1, 9.02, 24.18, 56.48, 24.32, 3.2, 0];
t = 0:0.05:20;
c = step(num, den, t);
plot(t, c, '-', t,t,'.')
grid
title('Unit-Ramp Response of Compensated System')
xlabel('t (sec)')
ylabel('Unit-Ramp Input and Output c(t)')
