t=0:pi/10:6*pi;
x=cos(t);
y=sin(t);
z=t;
plot3(x,y,z)
grid
title('Three-dimensional coil')
axis('square')
xlabel('x-axis')
ylabel('y-axis')
zlabel('z-axis')