t = 0:0.01:5;
k = [0.1, 0.2, 0.3, 0.4, 0.5];
    for n = 1:5;
        numg1 = [12.5];deng1 = [1,1];sysg1 = tf(numg1, deng1);
        sysg2 = [k(n)];
        numg3 = [1];deng3 = [1,0];sysg3 = tf(numg3,deng3);
        sys1 = feedback(sysg1,sysg2);
        sys2 = series(sys1,sysg3);
        sys = feedback(sys2,1);
        y(:,n) = step(sys,t);
    end
plot(t,y)
grid
title('Unit-Step Response Curves for k = 0.1,0.2,0.3,0.4, and 0.5')
xlabel('t (sec)')
ylabel('Outputs')
text(1.51,1.28,'\zeta = 0.1')
text(1.51,1.16,'\zeta = 0.2')
text(1.51,0.75,'\zeta = 0.3')
text(1.51,0.67,'\zeta = 0.4')
text(1.51,0.53,'\zeta = 0.5')