% led check output 11 pin

a = arduino('COM3')
a.pinMode(11, 'output')
for i = 1:10;
  a.digitalWrite(11,1) % 11 pin high
  pause(1);
  a.digitalWrite(11,0) % 11 pin low
  pause(1);
end

delete(a);
