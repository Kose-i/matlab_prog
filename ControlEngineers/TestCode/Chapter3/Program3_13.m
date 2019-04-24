t = 0:0.02:12;
num1 = [2];den1 = [1,0];sys1 = tf(num1,den1);
num2 = [2];den2 = [1,4];sys2 = tf(num2,den2);
num3 = [1];den3 = [1,0];sys3 = tf(num3,den3);
sys4 = series(sys1,sys2);
sys5 = feedback(sys4, 1);
sys6 = series(0.75*sys5,sys3);
sys = feedback(sys6,1);
[c,t] = step(sys,t);
plot(t,c)
grid
title('Unit-Step Response C(s)/R(s)')
xlabel('t (sec)')
ylabel('Output c(t)')