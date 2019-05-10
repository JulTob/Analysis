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
    📝 Note: The "and" operator can return an inverted range with the void area if both intervals have no intersection. This has been chosen to remain as it's on a different level of abstraction where this "loses" sense.
      Same way, OR can include intervals of the void area contained in between intervals.
      Therefor AND and Or are not equivalent to Intersection nor Union of Interval Sets.
        But they can be constructed from the Interval objects and operations.
          That's why they were considered fundamental tenough to stay this way.
