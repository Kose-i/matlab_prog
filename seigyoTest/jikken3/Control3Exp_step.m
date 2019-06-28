
matrix = csvread("ForGraph.csv");
size(matrix)

%r = ;% 目標値
%T = [matrix(:,1),,];% それぞれの定常値
%k = [,,];% それぞれのゲイン
%
%num = [[], [], []];
%den = [[], [], []]
%
%sys = [tf(num(1), den(1)), tf(num(2), den(2)), tf(num(3), den(3))];
%
%step(t, sys(1))
%step(t, sys(2))
%step(t, sys(3))
