num = [2];
den = [1, 1, 2];
t = 0:0.2:10;
r = 0.5*t.^2;
y = lsim(num, den, r, t);
plot(t,r,'-', t,y,'-')
grid
title('Unit-Acceleration Response')
xlabel('t (sec)')
ylabel('Input and Output')
text(2.1, 27.5, 'Unit-Acceleration Input')
text(7.2, 7.5, 'Output')