A = [0, 1, 0;0, 0, 1;-6, -11, -6];
B = [0;0;1];
C = [5, 6, 1];
D = [0];
CONT = ctrb(A,B)

rank(CONT)

OBSER = obsv(A,C)

rank(OBSER)

% This system is controllable, but not observable.
% This suggests that there is a cancellation of terms in the numerator and denominator of the transfer function.

[num, den] = ss2tf(A,B,C,D);
sys = tf(num, den)

sys_min = minreal(sys)

% (s+1) terms in the numerator and denominator of the transfer function sys are canceled.
