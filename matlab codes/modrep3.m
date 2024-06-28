function [codedbits] = modrep3(bits)

codedbits = nan(1,(3*length(bits)));

for i = 1:length(bits)

    if bits(i) == 0
        codedbits((3*i-2):3*i) = [0,0,0];
    elseif bits(i) == 1
        codedbits((3*i-2):3*i) = [1,1,1];
    end

end

end
