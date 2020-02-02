
  type Coordinates is (X, Y, Z);
  type Vector is array (Coordinates) of Integer;
  
   function "+" (L, R : Vector) return Vector
  is
      Result: Vector;
  begin
    Result(X) := L(X) + R(X); Result(Y) := L(Y) + R(Y); Result(Z) := L(Z) + R(Z);
    return Result;
  end "+"
  
  funtion check_rectangularity(A,B,C : Vector) return Boolean
	  added : Vector := (0,0,0);
  is
    Added = A + B + c;
		if Added = (0,0,0) then
			return True;
		end if;
 		return Flase;
  end check_rectangularity;
  
  procedure sadiku_1_6 is
    A : Vector := (4,0,-1);
		B : Vector := (1,3,4);
  	C : Vector := (-5,-3,-3);
  begin
	  if check_rectangularity(A,B,C) then
			puy_line("It is a triangle");
		end if;
		Area := Cross(A,B) /2;
  end sadiku_1_6;
