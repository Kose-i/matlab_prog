% Response to initial condition

A = [0, 0, 1, 0;0, 0, 0, 1;-36, 36, -0.6, 0.6;18,-18,0.3,-0.3];
B = [0;0;1;0];
K = [130.4444,-41.5556,23.1000,15.4185];
Ke = [14.4, 0.6;0.3,15.7];
F = [0,0;0,0;1,0;0,1];
Aab = [1,0;0,1];
Abb = [-0.6,0.6;0.3,-0.3];
AA = [A-B*K, B*K*F; zeros(2,4), Abb-Ke*Aab];
sys = ss(AA,eye(6),eye(6),eye(6))
t = 0:0.01:4;
y = initial(sys, [0.1;0;0;0;0.1;0.05], t);
x1 = [1, 0, 0, 0, 0, 0]*y';
x2 = [0, 1, 0, 0, 0, 0]*y';
x3 = [0, 0, 1, 0, 0, 0]*y';
x4 = [0, 0, 0, 1, 0, 0]*y';
e1 = [0, 0, 0, 0, 1, 0]*y';
e2 = [0, 0, 0, 0, 0, 1]*y';

subplot(3,2,1);plot(t,x1);grid;title('Response to initial condition')
xlabel('t (sec)');ylabel('x_1')

subplot(3,2,2);plot(t,x2);grid;title('Response to initial condition')
xlabel('t (sec)');ylabel('x_2')

subplot(3,2,3);plot(t,x3);grid;title('Response to initial condition')
xlabel('t (sec)');ylabel('x_3')

subplot(3,2,4);plot(t,x4);grid;title('Response to initial condition')
xlabel('t (sec)');ylabel('x_4')

subplot(3,2,5);plot(t,e1);grid;title('Response to initial condition')
xlabel('t (sec)');ylabel('e_1')

subplot(3,2,6);plot(t,e2);grid;title('Response to initial condition')
xlabel('t (sec)');ylabel('e_2')
