A = [0, 1;20.6, 0];
B = [0;1];
C = [1, 0];
K = [29.6, 3.6];
Ke = [16;84.6];
sys = ss([A-B*K, B*K; zeros(2,2) A-Ke*C], eye(4),eye(4),eye(4))
t = 0:0.01:4;
z = initial(sys,[1;0;0.5;0],t);
x1 = [1, 0, 0, 0]*z';
x2 = [0, 1, 0, 0]*z';
e1 = [0, 0, 1, 0]*z';
e2 = [0, 0, 0, 1]*z';

subplot(2,2,1);plot(t,x1),grid
title('Response to Initial Condition')
ylabel('state variable x_1')

subplot(2,2,2);plot(t,x2),grid
title('Response to Initial Condition')
ylabel('state variable x_2')

subplot(2,2,3);plot(t,e1),grid
title('Response to Initial Condition')
ylabel('state variable e_1')

subplot(2,2,4);plot(t,e2),grid
title('Response to Initial Condition')
ylabel('state variable r_2')
xlabel('t (sec)')
