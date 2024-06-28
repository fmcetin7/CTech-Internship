function z = modulation(bits, M, phase);

if M == 1
    z = bpsk(phase,bits);
elseif M == 2
    z = qpsk(phase,bits);
elseif M == 3
    z = opsk(phase,bits);
elseif M == 4
    z = spsk(phase,bits);
    

end