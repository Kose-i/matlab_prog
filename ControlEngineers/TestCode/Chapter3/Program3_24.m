% Unit-ramp response

% ***** The unit-ramp response to obtained as unit-step response of G(s)/s
% ***** Enter the numerator and denominator of G(s)/s *****

num = [1];
den = [1, 1, 1, 0];

% ***** Specify the computing time points (such as t = 0:0.1:7) and then
% enter step-response command: c = step(num, den, t) *****

t = 0:0.1:7;
c = step(num, den, t);

% ***** In plotting the ramp-response curve, add the reference input to the
% plot. The reference input is t. Add to the argum,ent of the plot command
% with the following: t,t, '-'. Thus, the plot commandd becomes
% plot(t,c,'o',t,t,'-') *****
% ***** Add grid, title, xlabel, and ylabel *****

plot(t,c,'o',t,t,'-')
grid
title('Unit-Ramp Response Curve for System G(s)=1/(s^2 + s + 1)')
xlabel('t (sec)')
ylabel('Input and Output')