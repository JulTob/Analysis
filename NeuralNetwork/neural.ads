package Neural is

  type Value_type is digits 6 range 0.0 .. 1.0;
  type Intensity_type is digits 6 range 0.0 .. 1.0;

  --  type Input_t is <>;
  --  Type Output_t is <>;
  Type Data is Natural;
  Type Result is Char;



  -- Neuron and synaps Types --
  type Neuron_type is record
    Value : Value_type := 0.5;
  end record;

  type InterSynaps_type is record
    Intensity : Intensity_type := 0.5;
    Input : access Neuron_type;
    Output: access Neuron_type;
  end record;

  type InSynaps_type is record
    Intensity : Intensity_type := 0.5;
    Input : access Data;
    Output: access Neuron_type;
  end record;

  type OutSynaps_type is record
    Intensity : Intensity_type := 0.5;
    Input : access Neuron_type;
    Output: access Result;
  end record;

  type Neural_Network_type is record
    Input: Input_t;
    Output: Output_t;
    private:
      Synapses: Synaps_type;
  end record;



procedure Classify
  ( Net   : in out Neural_Network_type,
    Input : in out Input_t,
    Output: in out Output_t);

procedure Train
  ( Net   : in out Neural_Network_type,
    Input : in out Input_t,
    Output: in out Output_t);

procedure Predict
  ( Net   : in out Neural_Network_type,
    Input : in out Input_t,
    Output: in out Output_t);


end Neural;
