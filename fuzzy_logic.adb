package body Fuzzy_Logic is

  function "and"(L,R : Fuzzy) return Fuzzy is
  begin
    return L*R;
  end "and";

  function "or"(L,R : Fuzzy) return Fuzzy is
  begin
    return L+R-L*R;
  end "or";

  function "not"(F : Fuzzy) return Fuzzy is
  begin
    return 1.0-F;
  end "not";

end Fuzzy_Logic;
