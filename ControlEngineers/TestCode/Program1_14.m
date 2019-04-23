theta = -10:0.01:0;
r = -0.1*theta;
x = r.*cos(theta);
y = r.*sin(theta);
plot(x,y)
v = [-1, 1,-1, 1];axis(v);axis('square');
grid
title('Spiral')
xlabel('x')
ylabel('y')