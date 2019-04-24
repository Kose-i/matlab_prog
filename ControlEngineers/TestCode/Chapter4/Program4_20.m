% Unit-ramp response

% ***** Unit-ramp response will be obtained as the unit-step response of
% C(s)/[sR(s)] *****
% ***** Enter the numerators and denominators of C1(s)/[sR(s)] and
% C2(s)/[sR(s)], where C1(s) and C2(s) are Laplace transforms of the
% outputs of the compensated and un-compensated systems, respectively.
% *****

numc = [1.0235, 0.0512];
denc = [1, 3.005, 2.015, 1.0335, 0.0512, 0];
num = [1.06];
den = [1, 3, 2, 1.06, 0];

% ***** Specify the time range (such as t=0:0.1:50) and enter step command
% and plot command. *****

t = 0:0.1:50;
[c1,x1,t] = step(numc, denc, t);
[c2,x2,t] = step(num, den, t);
plot(t,c1,'-',t,c2,'.',t,t,'--')
grid
text(2.2, 27, 'Compensated system');
text(26,21.3, 'Uncompensated system');
title('Unit-Ramp Response of Compensated and Uncompensated Systems')
xlabel('t (sec)')
ylabel('Outputs c_1 and c_2')