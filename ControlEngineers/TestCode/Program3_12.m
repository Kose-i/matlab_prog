t = 0:0.01:10;
num1 = [20];den1 = [1,5,4];sys1 = tf(num1, den1);
num2 = [1];den2 = [1,0];sys2 = tf(num2,den2);
sys3 = feedback(sys1, 0.4490)
sys4 = series(sys3, sys2);
sys = feedback(sys4, 1);
step(sys, t)
grid
title('Unit-Step Response','Fontsize',20)
xlabel('t (sec)', 'Fontsize',20)
ylabel('Output c(t)','Fontsize',20)