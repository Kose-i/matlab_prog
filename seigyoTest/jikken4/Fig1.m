
sys = tf([1], [1, 1])

opt = bodeoptions
opt.Xlim = [0.01, 10];
opt.Ylim = [0, 30];
opt.YLabel.String(1) = cellstr("20log_{10}|G(j\omega)|");
opts.YLabel.String(2) = cellstr("\angleG(j\omega)");

opts.XLabel.String = "\omega";

%bode(sys, opts)
[mag, phase, wout] =bode(sys);

magdb = 20*log10(mag)
semilogx(wout, magdb(:,:))
%semilogx(wout, phase(:,:))

%semilogx(mag)

%hline = refline(0, -45)
%hline.LineStyle = '--'

%opts.TickLabel


%gtext("\fontsize{10} 折点周波数\omega_d=1/T");
%gtext("低周波数ゲインk=20log_{10}k");
