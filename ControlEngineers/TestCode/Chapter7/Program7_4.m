t = 0:0.01:8;
for K = [3:0.2:5, NaN];
  for a = [0.1:0.1:3, NaN];
    num = [4*K, 8*K*a, 4*K*a^2];
    den = [1, 6, 8+4*K, 4+8*K*a, 4*K*a^2];
    y = step(num, den, t);
    m = max(y);
    if 2.55 < m & m < 2.60;
      break;
    end;
  end;
  if 2.55 < m & m < 2.60;
    break;
  end;
end;
solution = [K, a, m]
