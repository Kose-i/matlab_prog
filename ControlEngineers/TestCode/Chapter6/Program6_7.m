% Response to initial condition:

A = [0, 1, 0;0, 0, 1;-1, -5, -6];
B = [0;0;1];
K = [199, 55, 8];
sys = ss(A-B*K, eye(3), eye(3),eye(3));
t = 0:0.01:4;
x = initial(sys, [1;0;0],t);
x1 = [1, 0, 0]*x';
x2 = [0, 1, 0]*x';
x3 = [0, 0, 1]*x';

subplot(3, 1, 1);plot(t, x1),grid
title('Response to Initial Condition')
ylabel('state variable x_1')

subplot(3, 1, 2);plot(t,x2),grid
ylabel('state variable x_2')

subplot(3, 1, 3);plot(t,x3),grid
xlabel('t (sec)')
ylabel('state variable x_3')
