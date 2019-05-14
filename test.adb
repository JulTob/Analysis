--gnatmake test.adb && test
with Ada.Text_IO;
with Ranges;

procedure Test is
  use Ranges;

  N : Interval := (From => 10, To => 100);
  M : Interval := (From => 1, To => 10);
begin
   Put (N);

   Put_Line (M);
   Put_Line(N+M);
   Put_Line(-M);
   Put_Line(N-M);
   Put_Line(N*M);
   Put_Line(N/M);
   Put_Line(N and M);
   Put_Line(N or M);




end Test;


--Compilation:
-- On Windows: gnatmake test.adb && test.exe
