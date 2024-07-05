function decodeddata = decyclic(codeddata)

decodeddata = nan(1,(length(codeddata)/2));

for i = 1:length(decodeddata)/2

    n = 4;
    k = 2;
    genpoly = cyclpoly(n,k);
    parmat = cyclgen(n,genpoly);
    trt = syndtable(parmat);
    
    decodeddata((2*i-1):2*i) = decode((codeddata((4*i-3):4*i)),n,k,'cyclic/binary',genpoly,trt);
end
end