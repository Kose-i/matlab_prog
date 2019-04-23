% This program plots the unit-step response curve and finds the rise time,
% peak time, maximum overshoot, and settling time.
% In this program the rise time is calculated as the time required for the
% response to rise from 10% to 90% of its final value.

num = [6.3223, 18, 12.811];
den = [1, 6, 11.3223, 18, 12.811];
t = 0:0.02:20;
[y,x,t] = step(num, den, t);
plot(t,y)
grid
title('Unit-Step Response')
xlabel('t (sec)')
ylabel('Output y(t)')
r1 = 1; while y(r1) < 0.1, r1 = r1 + 1;end;
r2 = 1; while y(r2) < 0.9, r2 = r2 + 1;end;
rise_time = (r2 - r1) * 0.02

[ymax, tp] = max(y);
peak_time = (tp - 1)*0.02

max_overshoot = ymax - 1

s = 1001;while y(s) > 0.98 & y(s) < 1.02;s = s -1;end;
settling_time = (s - 1)*0.02