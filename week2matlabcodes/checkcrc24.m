function m = checkcrc24(msg)

polynom = [1 1 0 0 0 0 1 1 0 0 1 0 0 1 1 0 0 1 1 1 1 0 0 1 1];

for i = 1:length(msg)-24
    if msg(i)==1
        msg(i:i+24) = xor ((msg(i:i+24)),polynom);
    end
end

appendixcrc = msg(end-23:end);

if appendixcrc == 0
    m = true;
else
    m = false;
end


end