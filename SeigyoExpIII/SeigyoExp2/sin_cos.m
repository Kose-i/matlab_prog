
t = 0:0.1:2*pi

x = sin(t)
y = cos(t)

plot(t, x, '+', t, y, '*')

xlabel('Time [s]')
ylabel('Response')
legend('sin', 'cos')
