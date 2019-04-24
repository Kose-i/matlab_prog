t = 0:0.2:12;
y = zeros(61, 6)

for n = 1:6;
    num = [1];
    den = [1, 2*(n-1)*0.2, 1];
    [y(1:61,n),x,t] = step(num, den, t);
end

figure(1)
plot(t,y)
grid
title('Unit-Step Response Curves')
xlabel('t (sec)')
ylabel('Output')

gtext('\zeta=0'),
gtext('0.2')
gtext('0.4')
gtext('0.6')
gtext('0.8')
gtext('1.0')

% To draw a three-dimensional plot, enter the following command: mesh(y) or
% mesh(y'). We shall show two three-dimensional plots, one using "mesh(y)"
% and the other using "mesh(y')". These two plots are the same, except that
% the x-axis and y-axis are intercharged.

figure(2)
mesh(y)
title('Three-Dimensioanl Plot of Unit-Step Response Curves Using Command "mesh(y)"')
xlabel('n, where n =1,2,3,4,5,6')
ylabel('Computation Time Points')
zlabel('Outputs')

figure(3)
mesh(y')
title('Three-Dimensional Plot of Unit-Step Response Curves Using Command "mesh(y transpose)"')
xlabel('Computation Time Points')
ylabel('n, where n=1,2,3,4,5,6')
zlabel('Outputs')