% Response to initial condition-- minimum-order observer

A = [0, 1;0, -2];
B = [0;4];
K = [4, 0.5];
Kb = 0.5;
Ke = 6;
Aab = 1;Abb = -2;
AA = [A-B*K, B*Kb;zeros(1,2), Abb-Ke*Aab];
sys = ss(AA, eye(3), eye(3), eye(3));
t = 0:0.01:8;
x = initial(sys, [1;0;1], t);
x1 = [1, 0, 0]*x';
x2 = [0, 1, 0]*x';
e  = [0, 0, 1]*x';

subplot(2,2,1);plot(t,x1);grid
xlabel('t (sec)');ylabel('x_1')

subplot(2,2,2);plot(t,x2);grid
xlabel('t (sec)');ylabel('x_2')

subplot(2,2,3);plot(t,e);grid
xlabel('t (sec)');ylabel('e')
