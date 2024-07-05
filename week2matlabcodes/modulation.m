

function z = modulation(bits, M, phase)
%This function modulates the binary bit input according to the M value 
% and an offset phase to complex symbol outputs. 

if M == 1
    z = bpsk(phase,bits);
elseif M == 2
    z = qpsk(phase,bits);
elseif M == 3
    z = opsk(phase,bits);
elseif M == 4
    z = spsk(phase,bits);
    

end
end