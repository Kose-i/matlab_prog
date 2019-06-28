filename = "douteiDate.csv"
matrix = csvread(filename)

t = matrix(:,1);
data_g = matrix(:,2);
% data_g = matrix(:,3);
% data_g = matrix(:,4);

hold on

scatter(t(1:size(t)-1), data_g(1:size(t)-1))
%scatter(t(1:size(t)-5), data_g(1:size(t)-5))
%scatter(t(1:size(t)-9), data_g(1:size(t)-9))

ylabel('角度[deg]')
xlabel('時点')
grid

y = t(1:size(t)-1)*(-0.3) + 1
%y = t(1:size(t)-5)*(-0.3) + 1
%y = t(1:size(t)-9)*(-0.3) + 1

plot(t(1:size(t)-1), y)
%plot(t(1:size(t)-5), y)
%plot(t(1:size(t)-9), y)

hold off

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
