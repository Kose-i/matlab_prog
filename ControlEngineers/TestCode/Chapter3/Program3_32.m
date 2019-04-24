t = 0:0.01:10;
u = 0.5*t.^2;
sys = tf([1], [1,3,5]);
[y,t] = lsim(sys, u, t);
plot(t,y)
grid
title('Plot of Solution Curve for Differential Equation')
xlabel('t (sec)')
ylabel('Output y(t)')