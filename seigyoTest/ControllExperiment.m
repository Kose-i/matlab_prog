%num = [1];
%den = [1, 4, 4];
%t = 0:10:1;
%sys = tf(num, den);
%[y,t] = step(sys);
%plot(t, y);
%grid
%xlabel('xlabel')
%ylabel('ylabel')
% ***step(num, den, t); %

%filename = "2019052804.csv";
filename = "20190614.csv"
m = csvread(filename);
m
plot(m(:, 1), m(:,4));

plot(m(:, 1), m(:,3));
grid
ylabel('入流量')
xlabel('ステップ数')
