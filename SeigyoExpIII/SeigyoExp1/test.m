
tf_test = tf([2.003], [370, 1], 'InputDelay', 70)

[Gm, Pm, Wcg, Wcp] = margin(tf_test)

