X = [0: 0.01: 3];
Y = X;

for index = 1:301
  if X(index)<1 
    Y(index) = 1-2*X(index)*X(index) + X(index)*X(index)*X(index)
  elseif X(index)<2
    Y(index) = 4-8*X(index)+ 5*X(index)*X(index) - X(index)*X(index)*X(index)
  else 
    Y(index) = 0
  end
end

gcf = figure

%set(gcf, 'position', [10, 10, 550, 400])
set(gcf, 'units', 'points', 'position', [10, 10, 400, 200])

ylim([-1, 2])
plot(X, Y)

%str = '$$ \int_{0}^{2} x^2\sin(x) dx $$';
%text(1.1,0.5,str,'Interpreter','latex')

xlabel('$$ x $$', 'Interpreter', 'latex')
ylabel('$$ {\rm sin}(\pi x)/\pi x $$', 'Interpreter', 'latex')

