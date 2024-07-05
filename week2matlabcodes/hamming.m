

function codeddata = hamming(data)


a = 63; 
b = 57; 

codeddata = encode(data,a,b,'hamming/binary');

end