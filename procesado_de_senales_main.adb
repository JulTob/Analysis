with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

with Procesado_Senales;
use Procesado_Senales;

procedure Procesado_De_Senales_Main is

    type Sujeto is (Julio, Nadia);

    ComemosFuera: Hipotesis:= Tesis;
    Dato: Muestra;

begin --Procesado_De_Senales_Main

    Put_Line("Comemos Fuera?");
    Put_Line("De 1 a 10 cuanto picante quieres?");
    Get(Dato.Parametro);
    Put_Line("De 1 a 10 cuanto queso quieres?");
    Get(Dato.Parametro);

    if DecisorD(Dato)=Acorde then
        Put_Line("Mexicano entonces");
    else
        Put_Line("Kebab?");
    end if;

end Procesado_De_Senales_Main;
