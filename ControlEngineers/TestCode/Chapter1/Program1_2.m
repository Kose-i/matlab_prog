t=0:0.01*pi:2*pi;
alpha = 3;
y = sin(alpha*t);
plot(t,y)
grid
title('Plot of sin(\alphat) (\alpha=t)', 'Fontsize',20)
xlabel('t (sec)','Fontsize', 20)
ylabel('sin(\alphat)','Fontsize',20)