num = [5];
den = [1, 1, 5];
t = 0:0.05:10;
r = 2 +t;
c = lsim(num, den, r, t);
plot(t, r, '-', t, c, 'o')
grid
title('Response to Input r(t)=2+t')
xlabel('t (sec)')
ylabel('Output c(t) and Input r(t)=2+t')