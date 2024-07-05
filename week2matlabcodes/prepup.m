function [mod_type,fec_type,bcpp] = prepup(fec_type_input,mod_type_input)

%this function gives the fec_type and mod_type vectors and the bit count
%per package as outputs by taking integer inputs.

if fec_type_input == 0
    fec_type = [0, 0, 0];
elseif fec_type_input == 1
    fec_type = [0, 0, 1];
elseif fec_type_input == 2
    fec_type = [0, 1, 0];
elseif fec_type_input == 3
    fec_type = [0, 1, 1];
elseif fec_type_input == 4
    fec_type = [1, 0, 0];
elseif fec_type_input == 5
    fec_type = [1, 0, 1];
else%if fec_type_input >= 6
     fec_type = [1, 1, 0];
end

if mod_type_input == 0
    mod_type=[0,0];
elseif mod_type_input == 1
    mod_type = [0,1];
elseif mod_type_input == 2
    mod_type = [1,0];
elseif mod_type_input == 3
    mod_type = [1,1];
end

if isequal(fec_type, [0, 0, 0])
    n = 1;
elseif isequal(fec_type, [0, 0, 1])
    n = 1/2;
elseif isequal(fec_type, [0, 1, 0])
    n = 2/3;
elseif isequal(fec_type, [0, 1, 1])
    n = 1/3;
elseif isequal(fec_type, [1, 0, 0])
    n = 1/5;
elseif isequal(fec_type, [1, 0, 1])
    n = 1/7;
else %isequal(fec_type, [1, 1, 0]or[1,1,1])
     n = 1/3;
end

if isequal(mod_type,[0,0])
    m = 1;
elseif isequal(mod_type,[0,1])
    m = 2;
elseif isequal(mod_type,[1,0])
    m = 3;
elseif isequal(mod_type,[1,1])
    m = 4;
end

bcpp = 1050 * m * n; %bit count per package

end