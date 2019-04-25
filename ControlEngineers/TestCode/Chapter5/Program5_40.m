% ***** Unit-step response *****

figure(1)
num = [5, 21, 4];
den = [1, 5, 22, 4];
t = 0:0.01:14;
c = step(num, den, t);
plot(t, c)
grid
title('Unit-Step Response of Compensated System')
xlabel('t (sec)')
ylabel('Output c(t)')

% ***** Unit-ramp response *****

figure(2)
num1 = [5, 21, 4];
den1 = [1, 5, 22, 4, 0];
t = 0:0.02:20;
c = step(num1, den1, t);
plot(t,c,'-', t,t,'--');grid
title('Unit-Ramp Response of Compensated System')
xlabel('t (sec)')
ylabel('Unit-Ramp Input and Output c(t)')
text(10.7, 8, 'Compensated System')
