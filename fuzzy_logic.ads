package Fuzzy_Logic is

type Fuzzy is --new 
  digits 8
  range 0.0 .. 1.0;

function "and"(L,R : Fuzzy) return Fuzzy;
function "or"(L,R : Fuzzy) return Fuzzy;
function "not"(F : Fuzzy) return Fuzzy;


end Fuzzy_Logic;
