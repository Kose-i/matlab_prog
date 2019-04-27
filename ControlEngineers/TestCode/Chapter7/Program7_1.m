t = 0:0.01:8;
for K = 3:0.2:5;
  for a = 0.1:0.1:3;
    num = [4*K, 8*K*a, 4*K*a^2];
    den = [1, 6, 8+4*K, 4+8*K*a, 4*K*a^2];
    y = step(num, den, t);
    m = max(y);
    if 1.10 < m & m < 1.15;
      break; % Breaks the inner loop.
    end;
  end;
  if 1.10 < m & m < 1.15;
    break; % Breaks the outer loop.
  end
end;
solution = [K, a, m]

plot(t,y) % Unit-step response curve is shown in Figure 7-2.
grid
title('Unit-Step Response')
xlabel('t (sec)')
ylabel('Output y(t)')

