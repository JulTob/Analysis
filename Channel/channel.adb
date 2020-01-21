


with Ada.Numerics.Float_Random;

package body Channel is

   --  Random number generator.
   Gen : Ada.Numerics.Float_Random.Generator;
   

   -- Current bit error rate. This can be adjusted by calls to Error_Rate.
   Bit_Error_Rate : Float := 1.0E-3;

   -- Set up the channel.
   procedure 
   Reset is
   begin
      Ada.Numerics.Float_Random.Reset(Gen);
   end Reset;

   -- Set the bit error rate. 
   procedure 
   Set_Error_Rate
      (New_Rate : in Float range 0.0..0.5) is
   begin
      Bit_Error_Rate := New_Rate;
   end Set_Error_Rate;

   -- Corrupts bits in Data at rate given by Bit_Error_Rate.
   procedure 
   Transceive(Data : IN OUT Octet) is
      Dice  : Float;
      Masks : array(0..7) of Octet :=
        ( 2#00_00_00_01#, 2#00_00_00_10#, 2#00_00_01_00#, 2#00_00_10_00#, 
          2#00_01_00_00#, 2#00_10_00_00#, 2#01_00_00_00#, 2#10_00_00_00#);
   begin
      for I in 0..7 loop
         Dice := Ada.Numerics.Float_Random.Random(Gen);
         if Dice >= 0.5 and Dice < 0.5 + Bit_Error_Rate then
            Data := Data xor Masks(I);
         end if;
      end loop;
   end Transceive;

end Channel;
