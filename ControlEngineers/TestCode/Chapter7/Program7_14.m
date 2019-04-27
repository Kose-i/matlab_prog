% -- Unit-step response of designed system --

A = [0, 1, 0;0, 0, 1;0, -2, -3];
B = [0;0;1];
C = [1, 0, 0];
D = [0];
K = [100.0000, 53.1200, 11.6711];
k1 = K(1);k2 = K(2);k3 = K(3);

% ***** Define the state matrix, control matrix, output matrix, and direct transmission matrix of the designed system as AA, BB, CC, DD *****

AA = A - B*K;
BB = B*k1;
CC = C;
DD = D;
t = 0:0.01:8;
[y,x,t] = step(AA,BB,CC,DD, 1,t);
plot(t,x)
grid
title('Response Curves x_1, x_2, x_3, versus t')
xlabel('t (sec)')
ylabel('x_1,x_2,x_3')
text(2.6, 1.3, 'x_1')
text(1.2, 1.4, 'x_2')
text(0.6, 3.5, 'x_3')
