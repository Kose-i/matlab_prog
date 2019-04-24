% This is a MATLAB program to find the rise time, peak time,
% maximum overshoot, and settling time of the unit-step response
% curve of the second-order system and higher-order system

% In this example, we assume that zero = 0.6 and wn = 5
num = [25];
den = [1, 6, 25];
t = 0:0.005:5;
[y,x,t] = step(num, den, t);
r = 1;while y(r) < 1.0001;r = r + 1;end; % 定常値までにかかる時間
rise_time = (r - 1) * 0.005

[ymax,tp] = max(y);
peak_time = (tp - 1) * 0.005

max_overshoot = ymax - 1

s = 1001;while y(s) > 0.98 & y(s) < 1.02;s = s - 1;end; % 範囲外に現れる最後の時間
settling_time = (s - 1)*0.005
