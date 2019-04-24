t = 0:0.01:20;
K = [5, 10, 20];
    for n = 1:3;
        numg = [K(n)];deng = [1, 11, 10, 0];sysg = tf(numg, deng);
        sys = feedback(sysg, [1]);
        y(:,n) = step(sys, t);
    end
figure(1)
plot(t,y)
grid
title('Unit-Step Response Curves for K=5,10,20')
xlabel('t (sec)')
ylabel('Outputs')
text(4,6,1.33,'K=20')
text(6.5,1.12,'K=10')
text(4.4,0.72,'K=5')

% Note that if we want to plot individual curves separately, we use
% the commands plot(t,y(:,1)), plot(t,y(:,2)), and plot(t,y(:,3)).

figure(2)
subplot(2,2,1),plot(t,y(:,1)),grid,xlabel('t (sec)'),ylabel('Output')
text(10.5, 1.27, 'K=5')
subplot(2,2,2),plot(t,y(:,2)),grid,xlabel('t (sec)'),ylabel('Output')
text(10.2,1.27,'K=10')
subplot(2,2,3),plot(t,y(:,3)),grid,xlabel('t (sec)'),ylabel('Output')
text(10.1,1.27,'K=20')