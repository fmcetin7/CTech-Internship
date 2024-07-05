function decodeddata = delinearenc(codeddata)

decodeddata = nan(1,(length(codeddata)/2));
for i = 1:length(decodeddata)/2

    n = 4;
    k = 2;
    pol = cyclpoly(n,k);
    parmat = cyclgen(n,pol);
    genmat = gen2par(parmat);
    decodeddata((2*i-1):2*i) = decode((codeddata((4*i-3):4*i)),n,k,'linear/binary',genmat);

end
end