t = 0:0.01:3;
A = [0, 1;-10, -5];
B = [2;1];
[x,z,t] = step(A,B,A,B,1,t);
x1 = [1,0]*x';
x2 = [0,1]*x';
plot(t,x1,'x', t,x2,'-')
grid
title('Response to Initial Condition')
xlabel('t (sec)')
ylabel('State Variables x_1 and x_2')
gtext('x_1')
gtext('x_2')