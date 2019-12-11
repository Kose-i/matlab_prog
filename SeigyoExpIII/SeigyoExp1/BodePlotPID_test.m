
K_P = 0.818
K = 4.61574
T_I = 231.4
T_D = 0
L_P = 75
T = 370
tf_sys = tf([K*K_P*T_I, 0], [T_I*T, T_I, 0], 'InputDelay', L_P)
tf_test = tf([4.6157], [370, 1])

[Gm, Pm, Wcg, Wcp] = margin(tf_sys)

w = {0.001,0.1}
[mag,phase,wout] = bode(tf_sys,w)

figure

xlabel('ω [rad/s]')
xticks([0.001, 0.01, 0.1])
yticks([-20 -10 0 10])
yyaxis left

cp_mag = wout
for c = 1:size(wout)
  cp_mag(c) = mag(1,1,c)
end

cp_mag = 20*log10(cp_mag)
semilogx(wout, cp_mag)

hold on
ylabel('20log|G(jω)| [dB]')

cp_phase = wout
for c = 1:size(wout)
  cp_phase(c) = phase(1,1,c)
end

yyaxis right
yticks([-720 -630 -540 -450 -360 -270 -180 -90 0])
ylim([-720 0])

semilogx(wout, cp_phase, '--')
ylabel('∠G(jω) [degree]')

semilogx(wout, cp_phase, '--')
ylabel('∠G(jω) [degree]')

x_temp = [0.002 0.003]
y_temp = [-600 -600]
semilogx(x_temp, y_temp, '-')
x_temp = [0.002 0.003]
y_temp = [-640 -640]
semilogx(x_temp, y_temp, '--')
