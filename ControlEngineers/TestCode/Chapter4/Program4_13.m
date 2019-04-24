num = [1];
den = [1, 4, 5, 0];
r = rlocus(num, den);
plot(r, '-');v = [-3, 1, -2, 2];axis(v);axis('square')
grid
sgrid(0.5, [])
[K,r] = rlocfind(num, den)

xlabel('Real Axis')
ylabel('Imag Axis')