function in  = start_multi(in)
    max_x = 0.0212;
    expected_z = rand*(max_x - 0.002) + 0.001;
    %expected_z = 0.01;

    mdl = "MODEL_neural_multi";

    in = setVariable(in,"expected_z",expected_z,"Workspace",mdl);
    
end

