num1 = [1, 4, 6];
den1 = [1, 5, 4];
num2 = [-1, -4, -6];
den2 = [1, 5, 4];
nyquist(num2, den2);
hold on
nyquist(num1, den1);
v = [-2, 2, -1, 1];axis(v)
title('Nyquist Plots of G(s) and -G(s)')
text(1.0, 0.5, 'G(s)')
text(0.65, -0.53, 'Use this Nyquist')
text(0.62, -0.65, 'plot for negative')
text(0.65, -0.77, 'feedback system')
text(-1.3,0.5,'-G(s)')
text(-1.60, -0.53, 'Use this Nyquist')
text(-1.62, -0.53, 'plot for positive-')
text(-1.60, -0.77, 'feedback system')
