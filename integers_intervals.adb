with Ada.Integer_Text_IO;
with Ada.Text_IO;


package body Integers_Intervals is
  function Max(N,M: Integer) return Integer is
  begin
    if M>N then return  M;
    else return N;
    end if;
  end Max;
  function Min(N,M: Integer) return Integer is
  begin
    if M<N then return  M;
    else return N;
    end if;
  end Min;

  function "+"(Left, Right : Interval)  return Interval is
    Result : Interval;
  begin
    Result.To := Left.To + Right.To;
    Result.From := Left.From + Right.From;
    return result;
  end "+";
  function "-"(Left, Right : Interval)  return Interval is
    Result : Interval;
  begin
    Result.To := Left.To - Right.From;
    Result.From := Left.From - Right.To;
    return result;
  end "-";

  function "-"(Right : Interval)        return Interval is
    Result : Interval;
  begin
    Result.To := - Right.From;
    Result.From := - Right.To;
    return result;
  end "-";

  function "*"(Left, Right : Interval)  return Interval is
    Result : Interval;
  begin
    Result.To := Left.To * Right.To;
    Result.From := Left.From * Right.From;
    return result;
  end "*";

  function "/"(Left, Right : Interval)  return Interval is
    Result : Interval;
  begin
    Result.To := Left.To / Right.From;
    Result.From := Left.From / Right.To;
    return result;
  end "/";

  function "and"(Left, Right : Interval)  return Interval is
    Result : Interval;
  begin
    Result.To := Max(Left.To, Right.To);
    Result.From := Min(Left.From,Right.From);
    return result;
  end "and";

  function "or"(Left, Right : Interval)   return Interval is
    Result : Interval;
  begin
    Result.To := Min(Left.To, Right.To);
    Result.From := Max(Left.From,Right.From);
    return result;
  end "or";

  procedure Put(N: Interval) is
      use Ada.Integer_Text_IO;
      use Ada.Text_IO;
    begin
      Put("<");
      Put(N.From,1);
      Put("~");
      Put(N.To,1);
      Put(">");
  end Put;

    procedure Put_Line(N: Interval) is
      use Ada.Text_IO;
    begin
      Put(N); New_Line;
    end Put_Line;



end Integers_Intervals;
