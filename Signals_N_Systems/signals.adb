with Ada.Text_IO;
package body Signals is
  procedure Put(S: Signal) is
    use Ada.Text_IO;
  begin
    Put("<"); Put(integer'image(S'first));
    Put("<|");
    for i in S'range loop
      Put(value'image(S(i)));
      Put("|");
    end loop;
    Put(">");
    Put(integer'image(S'last)); Put(">");
  end Put;

  function "+"(v1: value; v2: value) return value is
    type check_type is delta 0.1**(3) range -24.1..24.1;
    check : check_type := check_type(v1) + check_type(v2);
  begin
    if check > 12.0 then return 12.0;
    elsif check < -12.0 then return -12.0;
    else return value(check);
    end if;
  end "+";

  function "*"(v1: value; v2: value) return value is
    type check_type is delta 0.1**(3) range -((120.1)**2)..((120.1)**2);
    check : check_type := check_type(v1) * check_type(v2);
  begin
    if check > 12.0 then return 12.0;
    elsif check < -12.0 then return -12.0;
    else return value(check);
    end if;
  end "*";

  function min(i1: Integer; i2: integer) return Integer is
  begin
    if i1<i2 then return i1; else return i2; end if;
  end min;

  function max(i1: Integer; i2: integer) return Integer is
  begin
    if i1>i2 then return i1; else return i2; end if;
  end max;

  function "+"(S1: Signal; S2: Signal) return Signal is
    a: value := 0.0;
    b: value := 0.0;
    from : constant integer := min(S1'first, S2'first);
    to: constant integer := max(S1'last, S2'last);
    S_result : Signal(from..to);
  begin
    for i in from..to loop
      declare
      begin
        a := S1(i);
      exception
        when others =>
          a := 0.0;
      end;
      declare
      begin
        b := S2(i);
      exception
        when others =>
          b := 0.0;
      end;
      S_result(i):= a+b;

    end loop;
    return S_result;
  end "+";

  function "-"(S1: Signal; S2: Signal) return Signal is
    negS2: Signal := S2;
  begin
      for i in s2'range loop
        negS2(i):= -S2(i);
      end loop;
      return S1+negS2;
    end "-";

    function modular (
      limit: integer;
      i: integer)
      return Integer is
    begin
      if i>limit then
        return modular(limit,(i-limit));
      elsif i<-limit then
        return modular(limit,(limit-i));
      else
        return i;
      end if;
    end modular;

    function modtime(from,to: Integer; time_delay: Integer := 0) return Signal is --AKA Saw signal
          result: Signal(from..to);
    begin
        for i in from..to loop
          result(i) := value(modular(12,i+time_delay));
        end loop;
        return result;
    end modtime;

    function saw (from,to: Integer; time_delay: Integer := 0) return Signal is --AKA Saw signal
    begin
      return  modtime(from,to,time_delay);
    end saw;

    function "*"(v: Value; S: Signal) return Signal is --Scalation
      result : Signal:= S;
    begin
      for i in S'first..s'last loop
        result(i) :=v*s(i);
      end loop;
      return result;
    end "*";

    function "**"(S1: Signal; S2: Signal) return Signal is --Convolution
      --S_x :  value;
      --S_t :  integer;
      from : constant integer := S1'first + S2'first;
      to : constant integer := S1'last + S2'last;
      S_result : Signal(from..to) := (others => 0.0);
    begin
      for t1 in S1'first .. S1'last loop
        for t2 in S2'first .. S2'last loop
          S_result(t1+t2) := S_result(t1+t2) + s1(t1) * s2(t2);
        end loop;
      end loop;
      return S_result;
    end "**";

function "*"(S1: Signal; S2: Signal) return Signal is -- Linear Selector, dot product
      a: value := 0.0;
      b: value := 0.0;
      from : constant integer := max(S1'first, S2'first);
      to: constant integer := min(S1'last, S2'last);
      S_result : Signal(from..to) := (others => 0.0);
    begin
      for i in from..to loop
        declare
        begin
          a := S1(i);
        exception
          when others =>
            a := 0.0;
        end;
        declare
        begin
          b := S2(i);
        exception
          when others =>
            b := 0.0;
        end;
        S_result(i):= a*b;

      end loop;
      return S_result;
    end "*";

    function delta_signal(from: integer := -1; to: Integer := 1; center_at: Integer := 0)
      return Signal is
      S_result : Signal(from..to) := (others => 0.0);
    begin
        S_result(center_at) := 1.0;
        return S_Result;
    end delta_signal;

    function add(S: Signal) return Float is
      result: float := 0.0;
    begin
      for t in S'range loop
        result := result + float(S(t));
      end loop;
      return result;
    end add;

    function step(from: integer := -1; to: Integer := 1; center_at: Integer := 0)
        return Signal is
          S_result : Signal(from..to) := (others => 0.0);
        begin
          S_result(center_at..to) := (others => 1.0);
          return S_result;
        end step;


end Signals;
