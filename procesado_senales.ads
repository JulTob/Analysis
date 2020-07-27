package Procesado_Senales is

type Probabilidad is new Long_Float range 0.0..1.0;

type Hipotesis is (Tesis, Antitesis, Unknown);

type Muestra is record
    Tipo : Hipotesis;

    Parametro: Integer;

end record;

type Decision is (Acorde, Desacorde);  --Con la tesis

function DecisorD (Dato: Muestra) return Decision;

type Verosimilitud is new Probabilidad;

function Precision (Senyal: Hipotesis;
                    Conjetura: Decision)
                    return Probabilidad;

end Procesado_Senales;
