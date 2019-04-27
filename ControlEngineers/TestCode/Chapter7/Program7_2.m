t = 0:0.01:8;
for K = 3:0.2:5; % Starts the outer loop to vary the K values.
  for a = 0.1:0.1:3; % Starts the inner loop to vary the a values.
    num1 = K*[1, 2*a, a^2];
    den1 = [1, 0];
    tf1 = tf(num1, den1);
    num2 = [4];
    den2 = [1, 6, 8, 4];
    tf2 = tf(num2, den2);
    tf3 = tf1*tf2;
    sys = feedback(tf3, 1);
    y = step(sys, t);
    m = max(y);
    if 1.10 < m & m < 1.15;
      plot(t,y) % See Figure7-3 for the unit-step response curve obatained.
      grid;
      title('Unit-Step Response')
      xlabel('t (sec)')
      ylabel('Output y(t)')
      solution = [K, a, m];
      break;
    end;
  end;
  if 1.10 < m & m < 1.15;
    break; % Breaks the outer loop.
  end;
end;
solution

KK = num2str(K); % String value of K to be printed on plot.
aa = num2str(a); % String value of a to be printed on plot.
text(2.20, 0.73, 'K='), text(2.75, 0.73, KK)
text(2.20, 0.53, 'a='), text(2.75, 0.53, aa)
