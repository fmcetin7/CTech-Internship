function bits = derepetition(codedbits,M)

if M == 3
    bits = demodrep3(codedbits);
elseif M == 5
    bits = demodrep5(codedbits);
elseif M == 7
    bits = demodrep7(codedbits);
end
end