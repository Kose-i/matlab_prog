num = [1];
den = [1, 4, 4];
t = 0:10:1;
sys = tf(num, den);
[y,t] = step(sys);
plot(t, y);
grid
xlabel('xlabel')
ylabel('ylabel')
% ***step(num, den, t); %
