% Bode diagram

% ***** Enter the numerator and denominator of the transfer function *****

num = [9, 1.8, 9];
den = [1, 1.2, 9, 0];

% ***** Specify the frequency range and enter the command [mag,phase,w] =
% bode(num,den,w)] *****
figure(1)

w = logspace(-2,3,100);
[mag,phase,w] = bode(num,den,w);

% Convert mag to decibels *****

magdB = 20*log10(mag);

% ***** Specify the range for the magnitude. For the system considered, the
% magnitude range should include -50 dB draw dBmax line and dBmin into the
% program and draw dBmax line and dBmin line. To plot the magdB curve enter
% the following dBmax, dBmin, and semilogx commands. *****

dBmax = 50*ones(1,100);
dBmin = -50*ones(1,100);
semilogx(w,magdB,'o',w,magdB,'-',w,dBmax,'-',w,dBmin,'-')

% ***** Enter grid, title, xlabel, and ylabel *****

figure(2)
grid
title('Bode Diagram of G(s)=9(s^2+0.2s+1)/[s(s^2+1.2s+9)]')
xlabel('Frequency (rad/sec)')
ylabel('Gain dB')

% ***** Next, we shall plot the phase-angle curve *****
% ***** Specify the range for the phase angle. For the system considered,
% the phase-angle range should include -150 degrees and +150 degrees. Enter
% pmax and pmin into the program and draw pmax line and pmin line. To plot
% the phase curve, enter the following pmax, pmin, and semilog commands.
% *****

pmax = 150*ones(1,100);
pmin = -150*ones(1,100);
semilogx(w,phase,'o',w,phase,'-',w,pmax,'-',w,pmin,'-')

% ***** Enter grid, xlabel, and ylabel *****

grid
xlabel('Frequency (rad/sec)')
ylabel('Phase deg')