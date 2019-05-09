package Error_Range is
type Error_Range is digits 4; --Change precision at will
type Number_Base is digits 3; --But error digits = base digits +1
type Number is record
  Base: Number_Base;
  Error : Error_Range := 0.0;
end record;

function "+"(Left,Right : Number) return Number;
function "-"(Left,Right : Number) return Number;
function "*"(Left,Right : Number) return Number;
function "/"(Left,Right : Number) return Number;

procedure Put(N: Number);
procedure Put_Line(N: Number);

end Error_Range;
