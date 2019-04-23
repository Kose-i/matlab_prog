% Unit-Step response

num = [5, 100];
den = [1, 8, 32, 80, 100];
step(num, den)
grid
title('Unit-Step Response of C(s)/R(s) = (5s + 100)/(s^4 + 8s^3 + 32s^2 + 100)')