% ***** Unit-step response *****

figure(1)
num = [1];
den = [0.5, 1.5, 1, 1];
numc = [50, 5];
denc = [50, 150.5, 101.5, 51, 5];
t = 0:0.1:40;
[c1, x1, t] = step(num, den, t);
[c2, x2, t] = step(numc, denc, t);
plot(t, c1, '.', t, c2, '-')
grid
title('Unit-Step Responses of Compensated and Uncompensated Systems')
xlabel('t (sec)')
ylabel('Outputs')
text(12.7, 1.27, 'Compensated system')
text(12.2, 0.7, 'Uncompensated system')

% ***** Unit-ramp response *****

figure(2)
num1 = [1];
den1 = [0.5, 1.5, 1, 1, 0];
num1c = [50, 5];
den1c = [50, 150.5, 101.5, 51, 5, 0];
t = 0:0.1:20;
[y1,z1,t] = step(num1, den1, t);
[y2,z2,t] = step(num1c, den1c, t);
plot(t,y1,'.', t,y2,'-', t,t,'--')
grid
title('Unit-Ramp Responses of Compensated and Uncompensated Systems')
xlabel('t (sec)')
ylabel('Outputs')
text(8.3, 3.3, 'Compensated system')
text(8.3, 5, 'Uncompensated system')
