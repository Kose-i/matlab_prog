num = [1];
den = [1, 1, 0];
w = 0.1:0.1:100;
[re,im,w] = nyquist(num,den,w);
plot(re,im)
v = [-2, 2,-5,5];axis(v)
grid
title('Nyquist Plot of G(s)=1/[s(s+1)]')
xlabel('Real Axis')
ylabel('Imag Axis')