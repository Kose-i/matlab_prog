t=0:0.01*pi:2*pi;
y1=sin(t);
y2=sin(2*t);
y3=sin(t)+sin(2*t);
y4=(sin(t)).*(sin(2*t));
subplot(2,2,1),plot(t,y1),grid
xlabel('t (sec)'),ylabel('y_1 = sin(t)')
subplot(2,2,2), plot(t,y2), grid
xlabel('t (sec)'),ylabel('y_2 = sin(2*t)')
subplot(2,2,3), plot(t,y3), grid
xlabel('t (sec)'),ylabel('y_3 = sin(t) + sin(2t)')
subplot(2,2,4), plot(t,y4), grid
xlabel('t (sec)'),ylabel('y_4 = sin(t)*sin(2t)')