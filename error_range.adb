with Ada.Float_Text_IO;
with Ada.Text_IO;

package body Error_Range is

  function Absl(Err: Error_Range) return Error_Range is
  begin
    if Err>0.0 then
        return Err;
      else
        return -Err;
    end if;
  end Absl;

  function "+"(Left,Right : Error_Range) return Error_Range is
  begin
    return Error_Range(float(Absl(Left)) + float(Absl(Right)));
  end "+";

  function "+"(Left,Right : Number) return Number is
      result: Number;
  begin
    Result.Base := Left.Base + Right.Base;
    Result.Error := Left.Error + Right.Error;
    return Result;
  end "+";


  function "-"(Left,Right : Error_Range) return Error_Range is
  begin
    return Left + Right;
  end "-";

  function "-"(Left,Right : Number) return Number is
      result: Number;
  begin
    Result.Base := Left.Base - Right.Base;
    Result.Error := Left.Error - Right.Error;
    return Result;
  end "-";

  function "*"(Left: Number_Base ; Right : Error_Range) return Error_Range is
      result: Error_Range;
  begin
    Result := Error_Range(Left) * Right;
    return Absl(Result);
  end "*";

  function "*"( Left : Error_Range; Right: Number_Base) return Error_Range is
  begin
    return Right * Left;
  end "*";

  function "*"(Left,Right : Number) return Number is
      result: Number;
  begin
    Result.Base := Left.Base * Right.Base;
    Result.Error := Left.Error * Right.Base
        + Left.Base * Right.Error
        + Left.Error * Right.Error;
    return Result;
  end "*";

  function Max(Left,Right : float) return float is
   begin
     if Left>Right then return Left;
     else return Right;
     end if;
   end Max;

 function "/"(Left,Right : Number) return Number
 is
    TopPlus, TopMin: float;
    BottomPlus, BottomMin: float;
    result: Number;
begin
  Result.Base := Left.Base / Right.Base;
  -- max { c/a  * (1+-d/c)/(1+-b/a)}
  -- Is this optimized? NOPE. Not at all. FML
  TopPlus := float(Left.Base)+float(Left.Error);
  TopMin := float(Left.Base)-float(Left.Error);
  BottomPlus :=float(Right.Base)+float(Right.Error);
  BottomMin := float(Right.Base)-float(Right.Error);
  Result.Error := Absl( Error_Range(  float(Result.Base) -
   Max(
      Max( TopPlus/BottomPlus, TopPlus/BottomMin )
      ,Max( TopMin/BottomPlus, TopMin/BottomMin )
    )));
  return Result;
end "/";


  procedure Put(N: Number) is
    use Ada.Float_Text_IO;
    use Ada.Text_IO;
  begin
    Put(float(N.Base));
    Put("  ~");
    Put(float(N.Error));
  end Put;

  procedure Put_Line(N: Number) is
    use Ada.Text_IO;
  begin
    Put(N); New_Line;
  end Put_Line;

end Error_Range;
