% Response to initial condition

% ***** System response to initial condition is converted to a unit-step
% response by modifying the numerator polynomial *****
% ***** Enter the numerator and denominator of the transfer function
% G(s) *****

num = [0.1, 0.35, 0];
den = [1, 3, 2];

% ***** Enter the following step-response command *****

step(num, den)

% ***** Enter grid and title of the plot *****

grid
title('Response of Spring-Mass-Damper System to Initial Condition')