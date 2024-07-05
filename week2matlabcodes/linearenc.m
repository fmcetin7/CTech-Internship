function codeddata = linearenc(data)

codeddata = nan(1,(length(data)*2));

for i = 1:length(data)/2
    
    k = 2;
    n= 4;
    pol = cyclpoly(n,k);
    parmat = cyclgen(n,pol);
    genmat = gen2par(parmat);
    codeddata(4*i-3:4*i) = encode(data(2*i-1:2*i),n,k,'linear/binary',genmat);
end
end