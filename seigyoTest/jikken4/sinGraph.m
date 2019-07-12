%filename = "sinTminus.csv"
filename = "sinT.csv"
matrix = csvread(filename)

graph_x = matrix(:,1)
graph_y = matrix(:,2)

plot(graph_x, graph_y)
yticks([0])
xticks([])

ylim([-1.5, 1.5])

refline(0, 0)

hline = refline(0, 1)
hline.LineStyle = '--';

ylabel('y(t)')
xlabel('time[s]')

gtext('a')
gtext('\pi/\omega_i')
gtext('2\pi/\omega_i')
gtext('3\pi/\omega_i')
%gtext('c_i')
%gtext('-\phi_i/\omega_i')
%gtext('\pi-\phi_i/\omega_i')
%gtext('2\pi-\phi_i/\omega_i')
%gtext('3\pi-\phi_i/\omega_i')

