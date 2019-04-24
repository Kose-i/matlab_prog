% Unit-Ramp Response

figure(1)
num = [1, 10];
den = [1, 6, 9, 10];
t = 0:0.1:10;
r = t;
y = lsim(num, den, r,t);
plot(t,r,'-', t,y,'o')
grid
title('Unit-Ramp Response by Use of Command "lsim"')
xlabel('t (sec)')
ylabel('Output')
text(3.2, 6.5, 'Unit-Ramp Input')
text(6.0, 3.1, 'Output')

% Response to Input r1 = exp(-0.5t).

figure(2)
num = [1, 10];
den = [1, 6, 9, 10];
t = 0:0.1:12;
r1 = exp(-0.5*t)
y1 = lsim(num, den, r1, t);
plot(t, r1, '-', t, y1, 'o')
grid
title('Response to Input r_1 = exp^-^0^.^5^t')
xlabel('t (sec)')
ylabel('Input and Output')
text(1.4, 0.75, 'Input r_1  = exp^-^0^.^5^t')
text(6.2, 0.34, 'Output')