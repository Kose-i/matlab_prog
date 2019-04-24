t = 0:0.01:5;
num1 = [1];den1 = [1,2,0];sys1 = tf(num1,den1);
sys = feedback(sys1,[10]);
[c_d,t] = step(sys,t);
plot(t,c_d)
grid
title('Unit-Step Response C_d(s)/D(s)')
xlabel('t (sec)')
ylabel('Output to Unit-Step Disturbance Input')