function in  = start(in)
    max_x = 0.0212;
    %expected_z = rand*(max_x - 0.01) + 0.005;
    expected_z = 0.01;

    mdl = "MODEL_neural";
    in = setVariable(in,"z",0.011,"Workspace",mdl);
    in = setVariable(in,"v",0,"Workspace",mdl);
    in = setVariable(in,"i",0,"Workspace",mdl);
    in = setVariable(in,"A",0,"Workspace",mdl);

    in = setVariable(in,"expected_z",expected_z,"Workspace",mdl);
    
end

