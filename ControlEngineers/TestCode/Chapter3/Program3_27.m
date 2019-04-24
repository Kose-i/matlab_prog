% Ramp Response

num = [1];
den = [1, 1, 1];
t = 0:0.1:8;
r = t;
y = lsim(num, den, r, t);
plot(t,r,'-', t,y,'o')
grid
title('Unit-Ramp Response Obtained by Use of Command "lsim"')
xlabel('t (sec)')
ylabel('Unit-Ramp Input and System Output')
text(2.1, 4.65, 'Unit-Ramp Input')
text(4.5, 2.0, 'Output')