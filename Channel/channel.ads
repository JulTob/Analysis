package Channel is

   type Octet is mod 256;

   procedure Reset;
   procedure Set_Error_Rate(New_Rate : in Float);
   procedure Transceive(Data : in out Octet);

end Channel;
