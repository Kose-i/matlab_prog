A = [1, 0;0, -1];
B = [1;0];
C = [1, 1];
D = [0];
CONT = ctrb(A,B);
if rank(CONT) == size(A);
  disp('The system is controllable')
else
  if rank(CONT) == 0;
    disp('The system is uncontrollable')
  else
    disp('The system may be stabilizable')
  end
end

OBSER = obsv(A,C);
if rank(OBSER) == size(A);
  disp('The system is observable')
else
  if rank(OBSER) == 0;
    disp('The system is unobservable')
  else
    disp('The system may be detectable')
  end
end
