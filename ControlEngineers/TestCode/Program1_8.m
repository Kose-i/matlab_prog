t = 0:0.01:2*pi;
x = 2*cos(t);
y = 2*sin(t);
plot(x-2,y+1)
axis([-5,5,-5,5]);axis('square')
grid minor
title('A circle of radius 2 located at x=-2 and y=1')
xlabel('x')
ylabel('y')