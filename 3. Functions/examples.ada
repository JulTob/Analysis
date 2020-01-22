package Real_Functions body is

function soft_Step(x : Real) return Real is
  begin
    if x < 0.0 then
      return 0.0;
    elsif x < 1.0 then
      return x**2;
    else 
      return 1.0;
  End Soft_Step;
  
  function Floor(x: Real) return real is
    begin
      if x < 0.0 then
        return -ceil(-x);
      elsif x < 1.0 then
        return 0.0;
      else 
        return 1.0 + floor(x - 1.0);
      end if;
   end Floor;

  function ceil(x: Real) return real is
    begin
      if x < 0.0 then
        return -floor(-x);
      elsif x < 1.0 then
        return 1;
      else 
        return 1.0 + floor(x - 1.0);
      end if;
   end Ceil;

End Real_Functions;
