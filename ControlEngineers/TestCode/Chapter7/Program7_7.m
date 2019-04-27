t = 0:0.01:8;
K = 3:0.2:5;
a = 0.1:0.1:3;
k = 0;
for i = 1:11;
  for j = 1:30;
    num = [4*K(i), 8*K(i)*a(j), 4*K(i)*a(j)^2];
    den = [1, 6, 8+4*K(i), 8+8*K(i)*a(j), 4*K(i)*a(j)^2];
    y = step(num, den, t);
    m = max(y);
    if 1.10 < m & m < 1.20;
      k = k + 1;
      solution(k, :) = [K(i), a(j), m];
    end;
  end;
end;
solution

sortsolution = sortrows(solution, 3)

% Plot the response with the overshoot closest to 15%

K = sortsolution(13, 1)

a = sortsolution(13, 2)

num = [4*K, 8*K*a, 4*K*a^2]
den = [1, 6, 8+4*K, 4+8*K*a, 4*K*a^2]

y = step(num, den, t);
plot(t,y)
grid
title('Unit-Step Response')
xlabel('t (sec)')
ylabel('Output y')
