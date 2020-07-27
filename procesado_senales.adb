package body Procesado_Senales is

    function DecisorD (Dato: Muestra) return Decision is
    begin -- Decisor Directo, lo acepta todo
        return Acorde;
    end DecisorD;

    function Precision  ( Senyal : Hipotesis; Conjetura: Decision) return Probabilidad is
    begin --Precision, determina si se ha acertado y en que medida
        if Senyal=Tesis and then Conjetura= Acorde then
            return 1.0;
        elsif Senyal=Antitesis and then Conjetura=Desacorde then
            return 1.0;
        elsif Senyal=Antitesis and then Conjetura=Acorde then
            return 0.0;
        elsif Senyal=Tesis and then Conjetura=Desacorde then
            return 0.0;
        else
            return 0.5;
        end if;
    exception
        when others => return 0.5;
    end Precision;


end Procesado_Senales;
