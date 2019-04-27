t = 0:0.01:8;
k = 0;
solution = zeros(11, 4)
for K = 3:0.2:5;
  for a = 0.1:0.1:3;
    num = [4*K, 8*K*a, 4*K*a^2];
    den = [1, 6, 8+4*K, 4+8*K*a, 4*K*a^2];
    y = step(num, den, t);
    s = 801;while 0.98 < y(s) & y(s) < 1.02;s = s-1;end;
    ts = (s - 1)*0.01; % ts = settling time;
    m = max(y);
    if 1.10 < m & m < 1.15;
      if ts < 3.00;
        k = k + 1;
        solution(k,:) = [K, a, m, ts];
      end;
    end;
  end;
end;
solution

sortsolution = sortrows(solution, 3)

% Plot the response curve with the smallest overshoot shown in sortsolution table.

K = sortsolution(1,1),a = sortsolution(1,2)

num = [4*K, 8*K*a, 4*K*a^2]
den = [1, 6, 8+4*K, 4+8*K*a, 4*K*a^2];

y = step(num, den, t);
plot(t,y)
grid
title('Unit-Step Response')
xlabel('t (sec)')
ylabel('Output y(t)')
