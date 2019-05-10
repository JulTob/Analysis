package Integers_Intervals is

type Interval is record
  Bot : Integer;
  Top : Integer;
end record;

function "+"(Left, Right : Interval)  return Interval;
function "-"(Left, Right : Interval)  return Interval;
function "-"(Right : Interval)        return Interval;
function "*"(Left, Right : Interval)  return Interval;
function "/"(Left, Right : Interval)  return Interval;

function "and"(Left, Right : Interval)  return Interval;
function "or"(Left, Right : Interval)   return Interval;

procedure Put( N : Interval );
procedure Put_Line( N : Interval );

end Integers_Intervals;
