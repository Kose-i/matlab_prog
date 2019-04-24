t = 0:001:6;
k = 0;
for p = 1:8;
    zeta(p) = 0.6 + 0.05*p;
    for q = 1:8;
        w(q) = 0.5*q;
        num1 = [6];den1 = [1, 6, 11, 6];
        sys1 = tf(num1, den1);
        num2 = [w(q).^2];den2 = [1, 2*zeta(p)*w(q), w(q).^2];
        sys2 = tf(num2, den2);
        [y1, t] = step(sys1, t);
        [y2, t] = step(sys2, t);
        error_squared = (y1 - y2).^2;
        emax = max(error_squared);
        if emax < 0.05;
            k = k + 1;
            solution(k,:) = [k, zeta(p), w(q), emax];
        end
    end
end

solution