num = [10, 4];
den = [1, 4, 4];
t = 0:0.02:10;
y = step(num, den, t);
figure(1)
plot(t, y)
grid
title('Unit-Step Response')
xlabel('t (sec)')
ylabel('Output')

num1 = [10, 4];
den1 = [1, 4, 4, 0];
y1 = step(num1, den1, t);
figure(2)
plot(t,t,'--', t, y1)
v = [0, 10, 0, 10];axis(v);
grid
title('Unit-Ramp Response')
xlabel('t (sec)')
ylabel('Unit-Ramp Input and Output')
text(6.1, 5.0, 'Unit-Ramp Input')
text(3.5, 7.1, 'Output')