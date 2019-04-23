t = 0:0.01:10;
r = 0.08*t;
x = -r.*cos(t);
y = -r.*sin(t);
plot(x,y)
v = [-1, 1,-1, 1];axis(v);axis('square');
grid
title('Spiral')
xlabel('x')
ylabel('y')