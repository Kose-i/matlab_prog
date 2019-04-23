t=0:0.01*pi:2*pi;
alpha = 3;
y = sin(alpha*t);
plot(t,y)
grid
title('Plot of sin(\alphat) (\alpha=3)')
xlabel('t sec')
ylabel('sin (\alphat)')