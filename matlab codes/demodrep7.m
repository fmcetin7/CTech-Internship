function [bits] = demodrep7(codedbits)

bits = nan(1,length(codedbits)/7);



for i = 1:length(bits)
    if sum(codedbits((7*i-6):7*i))> 3
        bits(i) = 1;
    elseif sum(codedbits((7*i-6):7*i)) < 4
        bits(i) = 0;
    end
end


end