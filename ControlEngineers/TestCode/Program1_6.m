n = 10;
[x,y,z] = sphere(n);
mesh(x,y,z)
title('Mesh plot');
axis('equal')
xlabel('x-axis')
ylabel('y-axis')
zlabel('z-axis')