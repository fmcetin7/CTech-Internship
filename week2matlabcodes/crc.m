function out = crc(data)

datanew = [data, zeros(1,24)];

polynom = [1 1 0 0 0 0 1 1 0 0 1 0 0 1 1 0 0 1 1 1 1 0 0 1 1]; %x^24+x^23+x^18+x^17+x^14+x^11+x^10+x^7+x^6+x^5+x^4+x+1

for i = 1:length(datanew)-24
    if datanew(i)==1
        datanew(i:i+24) = xor ((datanew(i:i+24)),polynom);
    end
end

appendixcrc = datanew(end-23:end);

out = [data, appendixcrc];

end