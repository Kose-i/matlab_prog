xp = [0, 5*sin(pi/6)];
yp = [0, 5*cos(pi/6)];
plot(xp,yp);% 斜線
v = [-6,6,-4,8];axis(v);
hold
a = 0:0.01:2*pi;
x = 5*sin(pi/6)+0.5*cos(a);y=5*cos(pi/6)+0.5*sin(a);
plot(x,y)% 右上の丸
xb = [-3, 3, 3, -3, -3];
yb = [-3, -3, 0, 0, -3];
plot(xb,yb); % 土台の長方形
plot( 2+0.5*cos(a), -3.5+0.5*sin(a)) % 右下の丸
plot(-2+0.5*cos(a), -3.5+0.5*sin(a)) % 左下の丸
axis('square')