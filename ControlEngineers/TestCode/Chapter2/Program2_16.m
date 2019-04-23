num = [1, 3, 2];den = [1, 8, 19, 12];sys = tf(num, den);
sys

sys_min = minreal(sys) % 分母・分子の因数を消す