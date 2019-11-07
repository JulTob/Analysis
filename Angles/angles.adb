with Ada.Float_Text_IO;
with Ada.Integer_Text_IO;

package body Angles is

 --mod Tau

    procedure Put(A: in Degree) is
      use Ada.Integer_Text_IO;
    begin
      Put(Integer(A));
    end Put;

    procedure Put(A: in Radian) is
      use Ada.Float_Text_IO;
    begin
      Put(Float(A));
    end Put;


    function "+"(Left,Right : Radian) return Radian is
        result: Real;
    begin
        result := (Real(Left)+Real(Right));
        return To_Radian(result);
      end "+";

      function "+"(Left,Right : Degree) return Degree is
          result: Natural;
      begin
          result := (Natural(Left)+Natural(Right));
          return Degree(result mod 360);
      end "+";


    function To_Radian(N : Real) return Radian is
        result: Real := N;
    begin
          <<checkpoint>>
          if result > (Tau-del) then
            result := result-tau;
            GoTo checkpoint; --I know, but it's faster
          elsif result < 0.0 then
            result := result+tau;
            GoTo checkpoint; --I know, but it's faster
          end if;
          return radian(result);
      end To_Radian;

      function To_Radian(N : Degree) return Radian is
          result: Radian;
      begin
          result := Radian( Tau*Real(N)/360.0);
        return result;
      end To_Radian;

      function To_Degree(N : in Radian) return Degree is
          result: Degree;
      begin
          result := Degree( 360.0*Real(N)/Tau);
        return result;
      end To_Degree;

      function "+"(Left : Radian; Right : Degree) return Radian is
      begin
          return Left + To_Radian(Right);
      end "+";



end Angles;
