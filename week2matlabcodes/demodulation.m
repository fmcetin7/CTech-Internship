function bits = demodulation(z, M, phase)

%This function demodulates the complex symbol input according to the M value 
% and an offset phase to binary bit outputs. 

if M == 1
    bits = debpsk(z,phase);
elseif M == 2
    bits = deqpsk(z,phase);
elseif M == 3
    bits = deopsk(z,phase);
elseif M == 4
    bits = despsk(z,phase);

end

end
