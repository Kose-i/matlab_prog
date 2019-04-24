sys1 = tf([6], [1, 6, 11, 6]);
sys2_1 = tf([1], [1, 2*0.9, 1]);
sys2_2 = tf([1], [1, 2*0.85, 1]);
[y1, t] = step(sys1, t);
[y2_1, t] = step(sys2_1, t);
[y2_2, t] = step(sys2_2, t);

figure(1)
plot(t, y1, t, y2_1)
grid
title('Unit-Step Response of sys1 and sys2_1')
xlabel('t (sec)')
ylabel('Outputs y1 and y2_1')
text(2.05,0.87,'sys1')
text(3.3,0.72,'sys2_1')
text(1.45,0.14,'sys1')
text(0.16,0.25,'sys2_1')

figure(2)
plot(t,y1,t,y2_2)
grid
title('Unit-Step Response of sys1 and sys2_2')
xlabel('t (sec)')
ylabel('Outputs y1 and y2_2')
text(4.1,0.85,'sys1')
text(3.05,1.1,'sys2_2')
text(1.4,0.08,'sys1')
text(0.1,0.28,'sys2_2')