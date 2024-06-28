function bits = demodulation(z, M, phase);

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
