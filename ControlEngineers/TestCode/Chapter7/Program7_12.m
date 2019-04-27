% Response to initial condition.

A = [0, 1, 0;0, 0, 1;-35, -27, -9];
B = [0;0;1];
K = [0.0143, 0.1107, 0.0676];
sys = ss(A-B*K, eye(3),eye(3),eye(3));
t = 0:0.01:8;
x = initial(sys, [1;0;0],t);

x1 = [1, 0, 0]*x';
x2 = [0, 1, 0]*x';
x3 = [0, 0, 1]*x';

subplot(2,2,1);plot(t,x1);grid
xlabel('t (sec)');ylabel('x_1')

subplot(2,2,2);plot(t,x2);grid
xlabel('t (sec)');ylabel('x_2')

subplot(2,2,3);plot(t,x3);grid
xlabel('t (sec)');ylabel('x_3')
