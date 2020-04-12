--gnatmake test.adb && test
with Ada.Text_IO; use Ada.Text_IO;
with Signals;
procedure Test is
  use Signals;
  x : Signals.Signal(0..1) := (0.5, 0.5);
  y : Signals.Signal(-1..1) := (-1.0, 0.0, 1.0);
  t : Signals.Signal := Signals.modtime(-1,1,1);
begin
  Put("X= ");     Put(x);     New_Line;
  Put("Y= ");     Put(y);     New_Line;
  Put("t= ");     Put(t);     New_Line;
  Put("t+x= ");   Put(t+x);   New_Line;
  Put("t-x= ");   Put(t-x);   New_Line;
  Put("y**x= ");  Put(y**x);  New_Line;
  Put("x**t= ");  Put(x**t);  New_Line;
  Put("y**t= ");  Put(y**t);  New_Line;
  Put("t**t= ");  Put(t**t);  New_Line;
  Put("X**X= ");  Put(x**x);  New_Line;
  Put("t*t= ");   Put(t*t);   New_Line;
  Put("x*t= ");   Put(x*t);   New_Line;
  Put("y*t= ");   Put(y*t);   New_Line;
  Put("delta= ");  Put(delta_signal(to => 4)); New_Line;
  Put("step= ");   Put(step(to => 5));         New_Line;


  Put(float'image(add(x)));  New_Line;

end Test;


--Compilation:
-- On Windows: gnatmake test.adb && test.exe
