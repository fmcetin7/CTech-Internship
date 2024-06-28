function [codedbits] = modrep7(bits)

codedbits = nan(1,7*length(bits));

for i = 1:length(bits)

    if bits(i) == 0
        codedbits((7*i-6):7*i) = [0,0,0,0,0,0,0];
    elseif bits(i) == 1
        codedbits((7*i-6):7*i) = [1,1,1,1,1,1,1];
    end

end

end
