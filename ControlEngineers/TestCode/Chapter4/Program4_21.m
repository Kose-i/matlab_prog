% Unit-step response

% ***** Enter the numerators and denominators of the compensated and
% uncompensated systems *****

numc = [1.0235, 0.0512];
denc = [1, 3.005, 2.015, 1.0335, 0.0512];
num = [1.06];
den = [1, 3, 2, 1.06];

% ***** Specify the time range (such as t=0:0.1:40) and enter step command
% and plot command. *****

t = 0:0.1:40;
[c1,x1,t] = step(numc, denc, t);
[c2,x2,t] = step(num, den, t);
plot(t,c1,'-',t,c2,'.')
grid
text(12.8,1.12,'Compensated system')
text(13.6,0.88,'Uncompensated system')
title('Unit-Step Response of Compensated and Uncompensated System')
xlabel('t (sec)')
ylabel('Outputs c_1 and c_2')