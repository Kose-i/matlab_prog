eps = 0.000000001;
[X, Y] = meshgrid(-8: .5: 8);
% R = sqrt(X.^2+Y.^2) + eps;
% Z = sin(X)*sin(Y)./(X.*Y.+eps)
% Z = sin(X)*Y%./(X*Y+eps)
Z = sin(X).*sin(Y)./(X.*Y+eps);
figure
mesh(X, Y, Z)
