t = 0:0.2:10;
zeta = [0, 0.2, 0.4, 0.6, 0.8, 1.0];
y = zeros(51, 6)
for n = 1:6;
    num = [1];den = [1, 2*zeta(n), 1];sys = tf(num, den);
    y(:,n) = step(sys, t);
end

% To plot a two-dimensional diagram, enter the command plot(t,y).

figure(1)
plot(t,y)
grid
title('Two-Dimensional Plot of Unit-Step Response Curves')
xlabel('t (sec)')
ylabel('Outputs')
text(4.1, 1.86, '\zeta=0')
text(3.5, 1.5, '0.2')
text(3.5, 1.24, '0.4')
text(3.5, 1.08, '0.6')
text(3.5, 0.95, '0.8')
text(3.5, 0.86, '1.0')

% To plot a three-dimensional diagram, enter the command mesh(zeta,t,y) or
% mesh(t,zeta,y')

figure(2)
mesh(zeta, t, y)
title('Three-Dimensional Plot of Unit-Step Response Curves')
xlabel('\zeta')
ylabel('t (sec)')
zlabel('Outputs')

figure(3)
mesh(t,zeta,y')
title('Three-Dimensional Plot of Unit-Step Response Curves')
xlabel('t (sec)')
ylabel('\zeta')
zlabel('Outputs')