  
  
  type Coordinates is (X, Y, Z);
  type Vector is array (Coordinates) of Float;
  
   function "+" (L, R : Vector) return Vector
  is
      Result: Vector;
  begin
    Result(X) := L(X) + R(X); Result(Y) := L(Y) + R(Y); Result(Z) := L(Z) + R(Z);
    return Result;
  end "+"
