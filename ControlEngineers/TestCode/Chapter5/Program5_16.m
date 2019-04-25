num = [20, 20, 10];
den = [1, 11, 10, 0];
ww = logspace(-1, 2, 100);
[re,im,ww] = nyquist(num, den, ww);
plot(re,im)
v = [-2, 3, -5, 0];axis(v)
grid
title('Nyquist Diagram')
xlabel('Real Axis')
ylabel('Imaginary Axis')
hold

% Current plot held
w = [0.2, 0.3, 0.5, 1, 2, 6, 10, 20];
[re,im,w] = nyquist(num, den, w);
plot(re, im, 'o')
text(1.1, -4.8, 'w=0.2')
text(1.1, -3.1, '0.3')
text(1.25, -1.7, '0.5')
text(1.37, -0.4, '1')
text(1.8, -0.3, '2')
text(1.4, -1.1, '6')
text(0.77, -0.8, '10')
text(0.037, -0.8, '20')

% To get the values of magnitude and phase (in degrees) of G(jw) at the
% specified w values, enter the command [mag,phase,w]=bode(num,den,w)

[mag,phase,w] = bode(num, den, w);

% The following table shows the specified frequency values w and the
% corresponding values of magnitude and phase (in degrees).

[w mag phase]