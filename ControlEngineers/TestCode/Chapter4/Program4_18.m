% Unit-step response

% ***** Unit-step responses of compensated and uncompensated systems *****

numc = [18.7, 54.23];
denc = [1, 7.4, 29.5, 54.23];
num = [4];
den = [1, 2, 4];
t = 0:0.05:5;
[c1, x1, t] = step(numc, denc, t);
[c2, x2, t] = step(num, den, t);
plot(t,c1, t,c1,'o', t,c2, t,c2,'x')
grid
title('Unit-Step Response of Compensated and Uncompensated Systems')
xlabel('t (sec)')
ylabel('Outputs c_1 and c_2')
text(0.6, 1.32, 'Compensated system')
text(1.3, 0.68, 'Uncompensated system')