% Response to initial condition-- full-order observer

A = [0, 1;0, -2];
B = [0;4];
C = [1, 0];
K = [4, 0.5];
Ke = [14;36];
AA = [A-B*K, B*K;zeros(2,2), A-Ke*C];
sys = ss(AA, eye(4), eye(4), eye(4));
t = 0:0.01:8;
x = initial(sys, [1;0;1;0],t);
x1 = [1, 0, 0, 0]*x';
x2 = [0, 1, 0, 0]*x';
e1 = [0, 0, 1, 0]*x';
e2 = [0, 0, 0, 1]*x';

subplot(2,2,1);plot(t,x1);grid
xlabel('t (sec)');ylabel('x_1')

subplot(2,2,2);plot(t,x2);grid
xlabel('t (sec)');ylabel('x_2')

subplot(2,2,3);plot(t,e1);grid
xlabel('t (sec)');ylabel('e_1')

subplot(2,2,4);plot(t,e2);grid
xlabel('t (sec)');ylabel('e_2')
