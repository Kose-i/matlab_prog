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

filename = "ex4.csv";
m = csvread(filename);
m
plot(m(:, 1), m(:,2), 'o',m(:, 1), m(:,2), '-');
grid
ylabel('水位[cm]')
xlabel('出力電圧[v]')


%filename = "2019052804.csv";
%%filename = "20190614.csv"
%m = csvread(filename);
%m
%plot(m(:, 1), m(:,4), '-', m(:,1),m(:,3),'--');
%
%%text(6.1, 5.0, '推定値')
%grid
%ylabel('出力電圧[v]')
%xlabel('ステップ数')
