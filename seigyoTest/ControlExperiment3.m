filename = "jikken3_doutei.csv"
matrix = csvread(filename)

t = matrix(:,1);
data_g = matrix(:,2);

figure
data_t = zeros(size(t)-1);
for i=1:size(t)-1;
  data_t(i) = data_g(i+1) - data_g(i);
end;
scatter(t(1:size(t)-1), data_t)
ylabel('角度[deg]')
xlabel('時点')
grid

figure
data_u = zeros(size(t)-5);
for i=1:size(t)-5;
  data_u(i) = data_g(i+5) - data_g(i);
end;
scatter(t(1:size(t)-5), data_u)
grid
ylabel('角度[deg]')
xlabel('時点')

figure
data_v = zeros(size(t)-10);
for i=1:size(t)-10;
  data_v(i) = data_g(i+10) - data_g(i);
end;
scatter(t(1:size(t)-10), data_v)
grid
ylabel('角度[deg]')
xlabel('時点')
