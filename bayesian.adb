with Ada.Text_IO;

package body Bayesian is


  procedure Put(P: Probability) is
  begin
    Ada.Text_IO.Put(Probability'Image(P));
  end Put;
  procedure Put(R: Ratio) is
  begin
    Ada.Text_IO.Put(Ratio'Image(R));
  end Put;
  procedure Put_Line(P: Probability) is
  begin
    Put(P);
    Ada.Text_IO.New_Line;
  end Put_line;

  function To_Ratio(How_Many : Integer; Out_Of: Integer) return Ratio is
  begin
    return Ratio( float(How_Many)/float(Out_Of));
  exception
    when constraint_error =>
      Ada.Text_IO.Put_Line("Ratio range Run time Exception ");
      raise Bayes_Exception;
  end To_Ratio;

  function Ratio_to_Probability(How_Many : Integer; Out_Of: Integer) return Probability is
  begin
    return Probability( float(How_Many)/float(Out_Of));
  exception
    when constraint_error =>
      Ada.Text_IO.Put_Line("Ratio range Run time Exception ");
      raise Bayes_Exception;
  end Ratio_to_Probability;

  function Ratio_to_Probability(R : Ratio) return Probability is
  begin
    return Probability( float(R));
  exception
    when constraint_error =>
      Ada.Text_IO.Put_Line("Ratio out of probability range Run time Exception ");
      raise Bayes_Exception;
  end Ratio_to_Probability;

  function Theorem(H: Hypothesis; E: Evidence; E_Given_H: Probability)
    return Probability
  is
    --P(E) is >= to P(E|H) because P(E) = P(E|H)+P(E|¬H)
    result : probability;
  begin
    result := E_Given_H * Probability(H);
    result := result / Probability(E);
    return probability(result);
  exception
      when others =>
        Ada.Text_IO.Put_Line("Bayes Theorem Run time Exception ");
        raise Bayes_Exception;
  end Theorem;

function Total_Evidence(Given_H : Probability; Given_notH: Probability; H: Probability)
  return Evidence is
begin
  return (Given_H*H + Given_notH*(1.0-H) );
exception
      when others =>
        Ada.Text_IO.Put_Line("Total P(E) calculation Run time Exception ");
        raise Bayes_Exception;
end Total_Evidence;

function Actualize_Hypothesis (H: Hypothesis; E: Evidence; E_Given_H: Probability)
  return Hypothesis is
    result: Hypothesis;
begin
  result := Hypothesis(theorem(H,E,E_Given_H));
  return result;
  exception
        when others =>
          Ada.Text_IO.Put_Line("Updating P(H) calculation Run time Exception ");
          raise Bayes_Exception;
end Actualize_Hypothesis;

procedure Actualize_Hypothesis (H: in out Hypothesis; E: Evidence; E_Given_H: Probability) is
begin
  H := Hypothesis(theorem(H,E,E_Given_H));
exception
        when others =>
          Ada.Text_IO.Put_Line("Updating P(H) calculation Run time Exception ");
          raise Bayes_Exception;
end Actualize_Hypothesis;

Function Likelyhood (Given_H : Probability; Given_notH: Probability ; H: Probability)
  return Ratio is
  result : Ratio;
begin
  result := Ratio(Given_H) / Ratio(total_Evidence(Given_H,Given_notH,H));
  return result;
exception
        when others =>
          Ada.Text_IO.Set_Col(3);
          Ada.Text_IO.Put_Line("Likelihood(E) calculation Run time Exception ");
          raise Bayes_Exception;
end Likelyhood;


  --function Get return Probability is
  --  result: Probability;
  --begin
  --  result := Probability'Value(Ada.Text_IO.Get);
  --  return result;
  --end Get;

end Bayesian;
