function [bits] = demodrep5(codedbits)

bits = nan(1,length(codedbits)/5);



for i = 1:length(bits)
    if sum(codedbits((5*i-4):5*i))> 2
        bits(i) = 1;
    elseif sum(codedbits((5*i-4):5*i)) < 3
        bits(i) = 0;
    end
end


end