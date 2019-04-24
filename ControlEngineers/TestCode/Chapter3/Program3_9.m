%       Step response curves for system defined in state
% space

% ***** In this program, we plot step response curves of a system 
% having two inputs (u1 and u2) and two outputs (y1 and y2) *****

% ***** First we shall plot step response curves when the input is
% u1. Then we shall plot step resoponse curves when the input is
% u2 *****

A = [-1, -1;6.5, 0];
B = [1, 1;1, 0];
C = [1, 0;0, 1];
D = [0,0;0,0];

% ***** To plot step response curves when the input is u1, enter
% the command 'step(A,B,C,D,1)' *****

step(A,B,C,D,1)
grid
title('Step Response Plots: Input = u_1 (u_2=0)')
text(3.4, -0.05, 'Y1')
text(3.4, 1.4, 'Y2')

% ***** Next, we shall plot step response curves when the input
% is u2. Enter the command 'step(A,B,C,D,2)' *****

step(A,B,C,D,2)
grid
title('Step Response Plots: Input = u_2 (u_1=0)')
text(3,0.14,'Y1')
text(2.8, 1.1, 'Y2')