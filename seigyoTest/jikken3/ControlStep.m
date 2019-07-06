filename = "stepGraph.csv"
matrix = csvread(filename)

t = matrix(:,1)*0.01;
data_jikken = matrix(:,2);
data_zero = matrix(:,3);
data_five = matrix(:,4);
data_ten = matrix(:,5);

data_target = matrix(:,1);

data_target = data_target*0 + 45;

hold on
plot(t,data_jikken, '-')
plot(t,data_zero, '-o')
plot(t,data_five, '-x')
plot(t,data_ten,'-*')
plot(t,data_target, '--')

ylim([0, 50])

display_x = t(23:32);
display_y_1 = [12,12,12,12,12,12,12,12,12,12];
display_y_2 = [9,9,9,9,9,9,9,9,9,9];
display_y_3 = [6,6,6,6,6,6,6,6,6,6];
display_y_4 = [3,3,3,3,3,3,3,3,3,3];
display_y_5 = [15,15,15,15,15,15,15,15,15,15];

plot(display_x, display_y_1, '-')
plot(display_x, display_y_2, '-o')
plot(display_x, display_y_3, '-x')
plot(display_x, display_y_4, '-*')
plot(display_x, display_y_5, '--')

ylabel('角度[deg]')
xlabel('時間[s]')

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
