num1 = [1, 2, 1];den1 = [1, 0, 0];sys1 = tf(num1, den1);
num2 = [2];den2 = [1, 5];sys2 = tf(num2, den2);
sys_ss1 = ss(sys1);
sys_ss2 = ss(sys2);
sys_ss3 = series(sys_ss1, sys_ss2);
sys_ss = feedback(sys_ss3, [1])

sys_tf = tf(sys_ss)