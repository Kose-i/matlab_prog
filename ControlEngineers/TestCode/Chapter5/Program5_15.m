num = [20, 20, 10];
den = [1, 11, 10, 0];
w1 = 0.1:0.1:10;w2 = 10:2:100;w3 = 100:10:500;
w = [w1, w2, w3];
[re,im,w] = nyquist(num, den, w);
plot(re,im)
v = [-3, 3, -5, 1];axis(v)
grid
title('Nyquist Plot of G(s)=20(s^2+s+0.5)/[s(s+1)(s+10)]')
xlabel('Real Axis')
ylabel('Imaginary Axis')