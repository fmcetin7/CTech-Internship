function [codedbits] = modrep5(bits)

codedbits = nan(1,5*length(bits));

for i = 1:length(bits)

    if bits(i) == 0
        codedbits((5*i-4):5*i) = [0,0,0,0,0];
    elseif bits(i) == 1
        codedbits((5*i-4):5*i) = [1,1,1,1,1];
    end

end

end
