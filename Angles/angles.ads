package Angles is

  subtype Real is Float;

  Bit_Size: constant Positive := 32;

  Pi:   constant Real := 3.141_592_653_5;
--  π:    constant Real := Pi;
  Tau:  constant Real := 2.0*Pi;
--  τ:    constant Real := Tau;
  del:  constant Real := Tau/(2.0**(Bit_Size-1));
  --Honestly, I don't know why it needs the -1, but it works
--  δ:    constant Real := del;


  type Radian is delta del
    range 0.0 .. Tau;
    --range -Pi .. Pi; --alternativly
    for Radian'Size use Bit_Size; --32Bits size



  type Degree is mod 360;

  function "+"(Left,Right : Radian) return Radian;
  function "+"(Left,Right : Degree) return Degree;
  function "+"(Left : Radian; Right : Degree) return Radian;

  function To_Radian(N : in Float) return Radian;
  function To_Radian(N : in Degree) return Radian;

  function To_Degree(N : in Radian) return Degree;

  procedure Put(A: in Degree);
  procedure Put(A: in Radian);


end Angles;
