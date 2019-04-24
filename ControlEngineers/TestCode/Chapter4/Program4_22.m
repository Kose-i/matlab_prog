% Unit-step response

% ***** Enter numerators and denominators of systems with k=0.4490 and
% k=1.4130, respecitively. *****

num1 = [20];
den1 = [1, 5, 12.98, 20];
num2 = [20];
den2 = [1, 5, 32.26, 20];
t = 0:0.1:10;
[c1,x1,t] = step(num1,den1,t);
[c2,x2,t] = step(num2,den2,t);
plot(t,c1,t,c2)
text(2.5,1.12,'k=0.4490')
text(3.7,0.85,'k=1.4130')
grid
title('Unit-step Response of Two Systems')
xlabel('t (sec)')
ylabel('Outputs c_1 and c_2')