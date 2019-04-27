% 'K' and 'a' values to test

K = [2.0, 2.2, 2.4, 2.6, 2.8, 3.0];
a = [0.5, 0.7, 0.9, 1.1, 1.3, 1.5];

% Evaluate closed-loop unit-step response at each 'K' and 'a' combination that will yield a maximum overshoot less than 10%.

t = 0:0.01:5;
g = tf([1.2],[0.36, 1.86, 2.5, 1]);
k = 0;
for i = 1:6;
  for j = 1:6;
    gc = tf(K(i)*[1, 2*a(j), a(j)^2], [1, 0]); % controller
    G = gc*g/(1+gc*g); % closed-loop transfer function
    y = step(G,t);
    m = max(y);
    if m < 1.10;
      k = k+1;
      solution(k,:) = [K(i), a(j), m];
    end;
  end;
end;
solution % Print solution table

sortsolution = sortrows(solution, 3) % Print solution table sorted by column 3

% Plot the response with the largest overshoot that is less than 10%
figure(1)

K = sortsolution(15, 1)

a = sortsolution(15, 2)

gc = tf(K*[1, 2*a, a^2], [1, 0]);
G = gc*g/(1 + gc*g)
step(G,t)
grid % See Figure 7-6

% If you wish to plot the response with the smallest overshoot that is greater than 0%, then enter the following values of 'K' and 'a'
figure(2)

K = sortsolution(11, 1)

a = sortsolution(11, 2)

gc = tf(K*[1, 2*a, a^2], [1, 0]);
G = gc*g/(1+gc*g)
step(G, t)
grid % See Figure7-7
