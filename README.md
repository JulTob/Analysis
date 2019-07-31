# Analysis
Analytic tools.

Ada Packages:


📏 Error Range
___________
  Definition of Numeric type with Error Range.
  
  Allows operations with Numbers with uncertainty.
  
    Number =  Base ~ Error 
    
              Base ± Error
              
              
  Operations:   +   -   *   /   Put()   Put_Line()
 

🤙 Integer Intervals
___________
  Definition of Intervals of the type Integer.
  
  Allows operations with Numbers in a range from-to style.
  
    Number =  <From~To> 
    
              [From,To]
              
              
  Operations:   +   -   *   /  and or  Put()   Put_Line()
  
    📝 Note: The "and" operator can return an inverted range with the void area if both intervals have no intersection. 
    This has been chosen to remain as it's on a different level of abstraction where this "loses" sense.
    Same way, OR can include intervals of the void area contained in between intervals.
    Therefor AND and OR are not equivalent to Intersection nor Union of Interval Sets.
        But they can be constructed from the Interval objects and operations.
          That's why they were considered fundamental tenough to stay this way.
          
          
 📊 Bayesian
___________
  Bayesian Operations with probability type, and suptypes for Hypothesis and Evidence. Also handy type Ratio, so far a rename of Float.
  
  Allows operations on Bayesian Satistics.             
              
  Operations:  Put()   Put_Line()   To_Ratio(N1,N2)   Bayesian.Theorem(H,E,E|H)  Actualize_Hypothesis(H,E, E|H)
      total_Evidence(E|H, E|¬H, H)    Likelyhood(E|H, E|¬H, H)
      
  
  
  
  
   ➕ Series
___________
 So far is more an example of interface than anything else.
 Calculates the series sum from any positive number to another positive number. Default is 1 to input.
 Also functionalities for even and odd
              
  Operations:  Sum_Interface   Sum(from, to)   Sum(n)   is_Odd(n)  is_Even(n) 
  
  
    ⌀ Angles
 ____________
 Hard definition of pi and Tau
 Radians and 360º degrees.

  Operations:  +   To_Radian(Degree)   To_Degree(radian)     Put()   
