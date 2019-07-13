matrix = csvread('Target.csv');

matrix

K2 = 0.1:0.1:1;
K3 = 1:1:10;

w = [K2,K3];

sys = tf([1], [0.00108,0.274, 1])

[mag, phase] = bode(sys, w)
figure;
subplot(2,1,1);
magdb = 20*log10(mag(:,:))
hold on
semilogx(w,magdb);
x = matrix(:,1)
y = matrix(:,3)
scatter(x, y)
ylim=[-10, 10]
ylabel('20log_{10}|G(j\omega)|[dB]');
yticks([-10,0,10])
yticklabels({-10, 0, 10})
xticks([0.1, 1, 10])
xticklabels({0.1, 1, 10})

subplot(2,1,2);
hold on
semilogx(w,phase(:,:));
ylabel('\angleG(j\omega)[deg]');
x = matrix(:,1)
y = matrix(:,4)
scatter(x, y)
hline = refline(0,-45)
hline.LineStyle = '--'
ylim=[-90, 0]
yticks([-90,-45, 0])
yticklabels({-90,-45, 0})
xlabel('\omega[rad/s]')
xticks([0.1, 1, 10])
xticklabels({0.1, 1, 10})

%gtext("\fontsize{10} 折点周波数\omega_d=1/T");
%gtext("低周波数ゲインk=20log_{10}k");
