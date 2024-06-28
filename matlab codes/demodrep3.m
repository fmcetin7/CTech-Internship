function [bits] = demodrep3(codedbits)

bits = nan(1,length(codedbits)/3);



for i = 1:length(bits)
    if sum(codedbits((3*i-2):3*i))> 1
        bits(i) = 1;
    elseif sum(codedbits((3*i-2):3*i)) < 2
        bits(i) = 0;
    end
end


end