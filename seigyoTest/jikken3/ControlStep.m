filename = "stepGraph.csv"
matrix = csvread(filename)

t = matrix(:,1);
data_jikken = matrix(:,2);
data_zero = matrix(:,3);
data_five = matrix(:,4);
data_ten = matrix(:,5);

hold on
plot(t,data_jikken, '-')
plot(t,data_zero, '-o')
plot(t,data_five, '-x')
plot(t,data_ten,'-*')

ylabel('角度[deg]')
xlabel('時点')
grid

%data_u = zeros(size(t)-5);
%for i=1:size(t)-5;
%  data_u(i) = data_g(i+5) - data_g(i);
%end;
%scatter(t(1:size(t)-5), data_u)
%grid
%ylabel('角度[deg]')
%xlabel('時点')
%
%data_v = zeros(size(t)-10);
%for i=1:size(t)-10;
%  data_v(i) = data_g(i+10) - data_g(i);
%end;
%scatter(t(1:size(t)-10), data_v)
%grid
%ylabel('角度[deg]')
%xlabel('時点')
