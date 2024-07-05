function datapackage = packed(fec_type,mod_type,usedbits,currentpackagenum)

%this function packs a data package which consists of header and actual
%info (dataheadersym & symbols) by taking fec_type and mod_type vector
%inputs as well as the bits that will be packed with variable "currentpackagenum" 
% which stands for the current #package that is being packed

        if isequal(fec_type,[0,0,0])
            usedbitsfec = usedbits;
        elseif isequal(fec_type,[0,0,1])
            usedbitsfec = convolution(usedbits,1/2);
        elseif isequal(fec_type,[0,1,0])
            usedbitsfec = convolution(usedbits,2/3);
        elseif isequal(fec_type,[0,1,1])
            usedbitsfec = repetition(usedbits,3);
        elseif isequal(fec_type,[1,0,0])
            usedbitsfec = repetition(usedbits,5);
        elseif isequal(fec_type,[1,0,1])
            usedbitsfec = repetition(usedbits,7);
        else %isequal(fec_type,[1,1,0]or[1,1,1])
            usedbitsfec = convolution(usedbits,1/3);
        end
        
        if isequal(mod_type,[0,0])
            symbols = modulation(usedbitsfec,1,0);
        elseif isequal(mod_type,[0,1])
            symbols = modulation(usedbitsfec,2,0);
        elseif isequal(mod_type,[1,0])
            symbols = modulation(usedbitsfec,3,0);
        elseif isequal(mod_type,[1,1])
            symbols = modulation(usedbitsfec,4,0);
        end
    
        dataheader = zeros(1,64);
    
        packagenumstring = dec2bin(currentpackagenum,16);
        %currentpackagenum stands for the current #package that is being
        %packed
        packagenumvector = packagenumstring - '0';
    
        dataheader(49:64) = packagenumvector;
        dataheader(47:48) = mod_type;
        dataheader(44:46) = fec_type;
        dataheadersym = modulation(dataheader,1,0);
    
        datapackage = [dataheadersym, symbols];

end