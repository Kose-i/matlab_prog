K_p = 0.02490842
% 変更するデータ
T_p = 1508.1695
L_p = 34.187143

data = readmatrix("datasets/bc.CSV")
%time_table = [0:736]
%hold on
%
%plot(data(:,1))
%plot(data(:,2))
%plot(data(:,3))
%plot(data(:,4))
%plot(data(:,5))
tmp_data = data(:,5)
%t = ones(size(data(:,1)))
%t *= 2
t_size = size(tmp_data)
%for c = 1:t_size(1)
%    tmp_data(c) = tmp_data(c) - data(1,1);
%end
%size(tmp_data)
%size(t)
%tmp_data -= ones(size(data(:,1)))


sys = tf(K_p, [T_p, 1], 'InputDelay', L_p)
hold on

t = 0:10:(t_size-1)*10
size(t)

plot(t, tmp_data)

opt = stepDataOptions('StepAmplitude',50)
[y,t] = step(sys,t,opt)

for c = 1:t_size(1)
    y(c) = y(c) + data(1,1)
end

plot(t,y)

Error = 0
size_for = size(y)
for c = 1:size_for
    minus = abs(y(c) - tmp_data(c))
    if minus ~= 0
        nowError = minus / tmp_data(c)
        Error = Error + nowError
        if nowError > 1
            nowError
            minus
            tmp_data(c)
        end
    end
end
Ave_Error = Error/size_for(1)
