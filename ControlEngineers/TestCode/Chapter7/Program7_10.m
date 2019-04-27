% -- Attempt to design a quadratic optimal regulator system --

A = [-1, 1;0, 2];
B = [1;0];
Q = [1, 0;0, 1];
R = [1];
K = lqr(A,B,Q,R)
% ???Error using ==> ss.lqr
% Cannot compute a stabilizing LQR gain (the Riccati solution S and gain matrix K are infinite).
