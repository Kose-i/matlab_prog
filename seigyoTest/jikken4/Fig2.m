
sys = tf([10], [1.5, 1])

opts1 = bodeoptions
opts1.Xlim = [0.01, 10];
opts1.Ylim = [0, 30];
opts1.YLabel.String(1) = cellstr("20log_{10}|G(j\omega)|");
opts1.XLabel.String('')
set(opts1.XLabel.String(''), 'visible', 'off')
opts1.PhaseVisible = 'off';

Mag=subplot(2,1,1);bodeplot(sys,opts1);


opts2 = bodeoptions
opts2.Xlim = [0.01, 10];
opts2.Ylim = [-90, 0];
opts2.YLabel.String(2) = cellstr("\angleG(j\omega)");
opts2.XLabel.String = "\omega";
opts2.MagVisible = 'off';
hline = refline(0, -45)
hline.LineStyle = '--'

Phase=subplot(2,1,2);bodeplot(sys,opts2);title('');
%opts.TickLabel

%bode(sys, opts)

gtext("\fontsize{10} 折点周波数\omega_d=1/T");
gtext("低周波数ゲインk=20log_{10}k");
