t = 0:0.01:5;
num1 = [1];den1 = [1,2,0];sys1 = tf(num1,den1);
sys = feedback(10*sys1, [1])
[c_r, t] = step(sys, t);
plot(t,c_r)
grid
title('Unit-Step Response C_r(s)/R(s)')
xlabel('t sec')
ylabel('Output to Unit-Step Reference Input')