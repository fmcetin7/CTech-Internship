function [codedbits] = repetition (bits,M)

if M == 3
    codedbits = modrep3(bits);
elseif M == 5
    codedbits = modrep5(bits);
elseif M == 7
    codedbits = modrep7(bits);
end
end