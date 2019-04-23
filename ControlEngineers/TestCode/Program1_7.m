n = 10;
[x,y,z] = sphere(n);
surf(x,y,z)
title('Surf plot');
axis('equal')
xlabel('x-axis')
ylabel('y-axis')
zlabel('z-axis')