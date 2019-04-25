% ***** Nyquist plot in rectangular coordinates *****

num = [1.88, 0.188];
den = [1, 1.5, 0.5, 0];
w = 0.5:0.01:1.15;
[re,im,w] = nyquist(num, den, w);

% ***** Convert rectangular coordinates into polar coordinates by defining z,r,theta as follows *****

z = re + j*im;
z
r = abs(z);
theta = angle(z);

% ***** To draw polar plot, enter command 'polar(theta, r)' *****

polar(theta, r)
text(-1, 3, 'Check of Phase Margin')
text(0.3, -1.7, 'Nyquist plot')
text(-2.2, -0.75, 'Phase margin')
text(-2.2, -1.1, 'is 60 degrees')
text(1.45, -0.7, 'Unit circle')
