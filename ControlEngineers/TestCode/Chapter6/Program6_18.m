% Response to initial condition.

A = [0, 1, 0;0, 0, 1;0, -24, -10];
B = [0;10;-80];
K = [1.25, 1.25, 0.19375];
Kb = [1.25, 0.19375];
Ke = [-1;6.25];
Aab = [-1, 6.25];Abb = [0, 1;-24, -10];
AA = [A-B*K, B*Kb;zeros(2,3), Abb-Ke*Aab];
sys = ss(AA, eye(5), eye(5), eye(5))
t = 0:0.01:8;
x = initial(sys, [1;0;0;1;0], t);
x1 = [1, 0, 0, 0, 0]*x';
x2 = [0, 1, 0, 0, 0]*x';
x3 = [0, 0, 1, 0, 0]*x';
e1 = [0, 0, 0, 1, 0]*x';
e2 = [0, 0, 0, 0, 1]*x';

subplot(3,2,1);plot(t, x1);grid
xlabel('t (sec)');ylabel('x_1')

subplot(3,2,2);plot(t, x2);grid
xlabel('t (sec)');ylabel('x_2')

subplot(3,2,3);plot(t, x3);grid
xlabel('t (sec)');ylabel('x_3')

subplot(3,2,4);plot(t, e1);grid
xlabel('t (sec)');ylabel('e_1')

subplot(3,2,5);plot(t, e2);grid
xlabel('t (sec)');ylabel('e_2')
