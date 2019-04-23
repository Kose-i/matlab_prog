t = 0:pi/50:10*pi;
x = cos(t+3*pi/2);
y = sin(t+3*pi/2);
z = 0.1*t;
figure(1)
plot3(x,y,z)
grid
title('3D Coil');
xlabel('x')
ylabel('y')
zlabel('z')

% zx plane plot

figure(2)
plot(z,x)
grid
title('zx plane plot for coil')
xlabel('z')
ylabel('x')

% Rotate about axis (zx plane rotated about x axis by 15 degrees)

figure(3)

a = 15*pi/180;
c = cos(a);s = sin(a);
zp = s*y + c*z; % Rotate about x axis
xp = x;
yp = c*y - s*z;
plot(zp,xp) % Rorated zx plane plot
grid
title('zx plane rotated about x axis by 15 degrees')
xlabel('zp')
ylabel('xp')