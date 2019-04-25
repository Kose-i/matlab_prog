den = [0.1, 1.5, 5, 0];
for i = 1:3;
  if i ==1;K=1;[re1,im1] = nyquist([10*K],den);end;
  if i ==2;K=7.5;[re2,im2] = nyquist([10*K],den);end;
  if i ==3;K=20;[re3,im3] = nyquist([10*K],den);end;
end
plot(re1,im1,'-', re2,im2,'o', re2,im2,'-', re3,im3,'o', re3,im3,'-')
v = [-5, 1, -5, 1];axis(v)
grid
title('Nyquist Diagrams of G(s)=10K/[s(s+5)(0.1s+1)] for K=1,7.5, and 20')
xlabel('Real Axis');ylabel('Imaginary Axis')
text(-0.4, -3.7, 'K=1')
text(-2.75, -2.7, 'K=7.5')
text(-4.35, -1.7, 'K=20')
