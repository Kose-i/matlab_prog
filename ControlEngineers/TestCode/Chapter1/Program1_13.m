q = [0:0.1:10*pi];
r = (0.5).^(q/pi);
x = r.*cos(q);
y = r.*sin(q);
plot(x,y)
grid
v = [-1, 1,-1, 1];axis(v);axis('square')
title('Spiral')
xlabel('x')
ylabel('y')