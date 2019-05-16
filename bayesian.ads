package Bayesian is

type Probability is delta 0.1**(10) range 0.0 .. 1.0;

subtype Hypothesis is Probability;
subtype Evidence is Probability;

type Ratio is new float;

Bayes_Exception : exception;


procedure Put(P: Probability);
procedure Put(R: Ratio);
procedure Put_Line(P: Probability);
function To_Ratio(How_Many : Integer; Out_Of: Integer)
    return Ratio;
function Theorem(H: Hypothesis; E: Evidence; E_Given_H: Probability)
    return Probability;
procedure Actualize_Hypothesis (H: in out Hypothesis; E: Evidence; E_Given_H: Probability);
function Actualize_Hypothesis (H: Hypothesis; E: Evidence; E_Given_H: Probability)
  return Hypothesis;
function total_Evidence(Given_H : Probability; Given_notH: Probability;  H: Probability)
    return Evidence;

Function Likelyhood (Given_H : Probability; Given_notH: Probability; H: Probability)
    return Ratio;
--function Get return Probability;
end Bayesian;
