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
    Result.Top := Left.Top + Right.Top;
    Result.Bot := Left.Bot + Right.Bot;
    return result;
  end "+";
  function "-"(Left, Right : Interval)  return Interval is
    Result : Interval;
  begin
    Result.Top := Left.Top - Right.Bot;
    Result.Bot := Left.Bot - Right.Top;
    return result;
  end "-";

  function "-"(Right : Interval)        return Interval is
    Result : Interval;
  begin
    Result.Top := - Right.Bot;
    Result.Bot := - Right.Top;
    return result;
  end "-";

  function "*"(Left, Right : Interval)  return Interval is
    Result : Interval;
  begin
    Result.Top := Left.Top * Right.Top;
    Result.Bot := Left.Bot * Right.Bot;
    return result;
  end "*";

  function "/"(Left, Right : Interval)  return Interval is
    Result : Interval;
  begin
    Result.Top := Left.Top / Right.Bot;
    Result.Bot := Left.Bot / Right.Top;
    return result;
  end "/";

  function "and"(Left, Right : Interval)  return Interval is
    Result : Interval;
  begin
    Result.Top := Max(Left.Top, Right.Top);
    Result.Bot := Min(Left.Bot,Right.Bot);
    return result;
  end "and";

  function "or"(Left, Right : Interval)   return Interval is
    Result : Interval;
  begin
    Result.Top := Min(Left.Top, Right.Top);
    Result.Bot := Max(Left.Bot,Right.Bot);
    return result;
  end "or";

  procedure Put(N: Interval) is
      use Ada.Integer_Text_IO;
      use Ada.Text_IO;
    begin
      Put("<");
      Put(N.Top,1);
      Put("~");
      Put(N.Bot,1);
      Put(">");
  end Put;

    procedure Put_Line(N: Interval) is
      use Ada.Text_IO;
    begin
      Put(N); New_Line;
    end Put_Line;

end Integers_Intervals;
