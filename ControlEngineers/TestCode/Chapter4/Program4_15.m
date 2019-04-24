t = 0:0.1:10;
num = [1, 2];den = [1, 4, 0];
numn = [-1, 2];denn = [1, 4, 0];
sys = tf(num, den);
sysn = tf(numn, denn);
sys1 = feedback(sys,[1]);
sys2 = feedback(sysn, [1]);
[y1, t] = step(sys1, t);
[y2, t] = step(sys2, t);
plot(t,y1, t, y2, 'o')
grid
title('Step Responses of Minimum- and Non-minimum-Phase Systems')
xlabel('t (sec)')
ylabel('Responses y_1 and y_2')
text(5.0, 0.84, 'Minimum-Phase System')
text(2.3, 0.3, 'Non-minimum-Phase System')