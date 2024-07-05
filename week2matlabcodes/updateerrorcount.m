function errorcount = updateerrorcount(datareceived,errorcount)

%this function depacks the received symbols (datareceived) and checks the
%header info of datareceived to determine the fec_type and mod_type. Then
%according to the info on header; it depacks symbols in to bits. After that
%the function uses 24-bit crc check alghoritm to see whether any error has
%occured during transmission. 
%Basically this function increments the errorcount by 1 if the package is
%damaged. This function should be used in a for loop for testing purposes!


dataheadersymreceived = datareceived(1:64);
dataheaderreceived = demodulation(dataheadersymreceived,1,0);

fec_type_received = dataheaderreceived(44:46);
mod_type_received = dataheaderreceived(47:48);

symbols_received = datareceived(65:1114);

if isequal(mod_type_received,[0,0])
    bits_received = demodulation(symbols_received,1,0);
elseif isequal(mod_type_received,[0,1])
    bits_received = demodulation(symbols_received,2,0);
elseif isequal(mod_type_received,[1,0])
    bits_received = demodulation(symbols_received,3,0);
elseif isequal(mod_type_received,[1,1])
    bits_received = demodulation(symbols_received,4,0);
end

if isequal(fec_type_received,[0,0,0])
    bits_finalized = bits_received;
elseif isequal(fec_type_received,[0,0,1])
    bits_finalized = deconvolution(bits_received,1/2);
elseif isequal(fec_type_received,[0,1,0])
    bits_finalized = deconvolution(bits_received,2/3);
elseif isequal(fec_type_received,[0,1,1])
    bits_finalized = derepetition(bits_received,3);
elseif isequal(fec_type_received,[1,0,0])
    bits_finalized = derepetition(bits_received,5);
elseif isequal(fec_type_received,[1,0,1])
    bits_finalized = derepetition(bits_received,7);
else %if isequal(fec_type_received,[1,1,0]or[1,1,1])
     bits_finalized = deconvolution(bits_received,1/3);
end
if  not (checkcrc24(bits_finalized))
    errorcount = errorcount+1;
end  

end