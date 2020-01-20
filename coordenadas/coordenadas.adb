package Coordenadas body is

  function "+"(Left,Right : Position)
    return Position is
    result : Point;
  begin
    result.x := Left.x + Right.x;
    result.y := Left.y + Right.y;
    result.z := Left.z + Right.z;
    return result;
  end "+";


  function "-"(Left,Right : Position)
    return Position is
    result : Point;
  begin
    result.x := Left.x - Right.x;
    result.y := Left.y - Right.y;
    result.z := Left.z - Right.z;
    return result;
  end "-";


  function Modulus (Point: Position)
    return Number
    is
      result: Number;
  begin
    result:= sqrt(Point.X**2 + Point.Y**2 + Point.Z**2 );
    RETURN RESULT;
  end Modulus;

  function Distance (Point1: Position, Point2: Position)
    return Number is
      result : Number;
    begin
      result:= Modulus(Poin1-Point2);
      return result;
  end Distance;

end Coordenadas;
