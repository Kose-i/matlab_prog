t = 0:0.01:10*pi;
x = 1./pow2(t).*cos(pi*t);
y = 1./pow2(t).*sin(pi*t);
plot(x,y)
grid
v = [-1, 1,-1, 1];axis(v);axis('square')
title('Spiral')
xlabel('x')
ylabel('y')
