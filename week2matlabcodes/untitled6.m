data = randi([0 1],1,1000);

datanew = [data, zeros(1,24)];

poly = [1 1 0 0 0 0 1 1 0 0 1 0 0 1 1 0 0 1 1 1 1 0 0 1 1];

for i = 1:length(datanew)-24
    if datanew(i)==1
        datanew(i:i+24) = xor ((datanew(i:i+24)),poly);
    end
end

crc = datanew(end-24:end)

