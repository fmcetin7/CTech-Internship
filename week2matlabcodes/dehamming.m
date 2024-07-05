function decodeddata = dehamming(codeddata)


a = 63; 
b = 57; 

decodeddata = decode(codeddata,a,b,'hamming/binary');

end