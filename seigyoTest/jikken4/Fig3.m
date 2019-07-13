K1 = 0.01:0.01:0.1;
K2 = 0.1:0.1:1;
K3 = 1:1:10;

w = [K1,K2,K3];

sys = tf([20], [1.5, 1])

[mag, phase] = bode(sys, w)
figure;
subplot(2,1,1);
magdb = 20*log10(mag(:,:))
semilogx(w,magdb);
ylim=[0,30]
ylabel('20log_{10}|G(j\omega)|[dB]');
yticks([0, 10, 20, 30])
yticklabels({0, 10, 20, 30})

subplot(2,1,2);semilogx(w,phase(:,:));ylabel('\angleG(j\omega)[deg]');
hline = refline(0,-45)
hline.LineStyle = '--'
ylim=[-90, 0]
yticks([-90,-45, 0])
yticklabels({-90,-45, 0})
xlabel('\omega[rad/s]')

gtext("\fontsize{10} 折点周波数\omega_d=1/T");
gtext("低周波数ゲインk=20log_{10}k");
