numc = [1, 0.05];denc = [1, 3.005, 2.015, 0.01, 0];
num = [1.06];den = [1, 3, 2, 0];
r1 = rlocus(numc, denc);
plot(r1);v = [-3, 1, -2, 2];axis(v);axis('square')
grid
hold
% Current plot held
r2 = rlocus(num, den);
plot(r2);
title('Root-Locus Plot of Compensated and Uncompensated Systems')
xlabel('Real Axis');ylabel('Imag Axis')
text(-2.8, 0.2, 'Compensated System')
text(-2.8, 1.2, 'Uncompensated System')
text(-2.8, 0.58, 'Original closed-loop pole')
text(-0.1, 0.85, 'New closed-')
text(-0.1, 0.62, 'loop pole')
hold
% Current plot released

% Plot root loci of the compensated system near the origin.
plot(r1);v = [-0.6, 0.6, -0.6, 0.6];axis(v);axis('square')
grid
title('Root-Locus Plot of the Compensate System near the Origin')
xlabel('Real Axis');ylabel('Imag Axis')

% Manually enter 'o' and 'x' marks on open-loop zero and open-loop poles,
% respectively.