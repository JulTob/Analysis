package Signals is
  type value is delta 0.1**(3) range -12.0..12.0;
  type signal is array( integer range <>) of value;
  --sample_frequency
  procedure Put(S: Signal);
  function "+"(S1: Signal; S2: Signal) return Signal;
  function "-"(S1: Signal; S2: Signal) return Signal;
  function "*"(S1: Signal; S2: Signal) return Signal; 
     --   Linear w-Selector, dot product
  function "*"(v: Value; S: Signal) return Signal; 
     --   Linear scaling
  function "**"(S1: Signal; S2: Signal) return Signal; 
     --   Convolution
  function modtime(from,to: Integer; time_delay: Integer := 0) return Signal;
  function saw(from,to: Integer; time_delay: Integer := 0) return Signal; 
     --   AKA modtime signal /12


  function delta_signal 
    (from: integer := -1; to: Integer := 1; center_at: Integer := 0)
    return Signal ;
  function step
      (from: integer := -1; to: Integer := 1; center_at: Integer := 0)
      return Signal ;
  function add(S: Signal) return Float;

end Signals;
