t = 0:0.01:8;
for K = [3:0.2:5, NaN];
  for a = [0.2:0.2:2.2, NaN];
    num = [4*K, 8*K*a, 4*K*a^2];
    den = [1, 6, 8+4*K, 4+8*K*a, 4*K*a^2];
    y = step(num, den, t);
    m = max(y);
    if 1.18 < m & m < 1.20;
      break;
    end;
  end;
  if 1.18 < m & m < 1.20;
    break;
  end;
end;
solution = [K, a, m]
