% Unit-ramp response

% ***** The unit-ramp response if obtained by adding a new state variable
% x3. The dimension of the state equation is enlarged by 1 *****
% ***** Enter matrices A,B,C, and D of the original state equation and
% output equation *****

A = [0, 1;-1, -1];
B = [0;1];
C = [1, 0];
D = [0];

% ***** Enter matrices AA, BB, CC, and DD of the new, enlarged state
% equation and output equation *****

AA = [A, zeros(2,1);C, 0];
BB = [B; 0];
CC = [0, 0, 1];
DD = [0];

% ***** Enter step-response command: [z,x,t] = step(AA, BB, CC, DD) *****

t = 0:0.1:10;

[z,x,t] = step(AA,BB,CC,DD,1,t);

% ***** In plotting x3, add the unit-ramp input t in the plot by entering
% the following command: plot(t,x3,'o',t,t,'-') *****

x3 = [0, 0, 1]*x';plot(t,x3, 'o', t,t,'-')
grid
title('Unit-Ramp Response')
xlabel('t (sec)')
ylabel('Input and Output')