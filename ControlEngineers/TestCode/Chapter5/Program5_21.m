num = [100];
den = [1, 7.5, 0];
w = [1, 4, 8, 10, 20, 40, 100];
[mag, phase, w] = nichols(num, den, w);
magdB = 20*log10(mag);
plot(phase, magdB,phase,magdB,'o')
v=[-250,0,-60,40];axis(v)
ngrid
title('Nichols Plot')
xlabel('Open-Loop Phase (deg)')
ylabel('Open-Loop Gain (dB)')
text(-90, 22, '\omega=1')
text(-115, 9, '\omega=4')
text(-132, 0, '\omega=8')
text(-165, -26, '\omega=40')
text(-170, -41, '\omega=100')
