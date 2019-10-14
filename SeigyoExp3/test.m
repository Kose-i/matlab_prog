data = readmatrix("datasets/bc.CSV")
%time_table = [0:736]
%hold on
%
%plot(data(:,1))
%plot(data(:,2))
%plot(data(:,3))
%plot(data(:,4))
%plot(data(:,5))
tmp_data = data(:,1)
%t = ones(size(data(:,1)))
%t *= 2
t_size = size(tmp_data)
for c = 1:t_size(1)
    tmp_data(c) = tmp_data(c) - data(1,1);
end
%size(tmp_data)
%size(t)
%tmp_data -= ones(size(data(:,1)))

K_p = 0.025
T_p = 145.5
L_p = 1.93

sys = tf(24*K_p, [T_p, 1], 'InputDelay', L_p)
hold on
plot(tmp_data)
step(sys)
