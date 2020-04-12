package Coordenadas is

    subtype Number is digits 10;


    type Position is record
       X : Number;
       Y : Number;
       Z : Number;
      end record;

    function "+"(Left,Right : Position) return Position;
    function "-"(Left,Right : Position) return Position;

    function Modulus (Point: Position)
      return Number;

    function Distance (Point1: Position, Point2: Position)
      return Number;


 end Coordenadas;
