
function [m] = bpsk(phase,bits)

angle = nan(1, length(bits));


for n = 1:length(bits)
    if bits(n) == 0
        angle(n) = 0;
    else
        angle(n) = pi;
    end
end

m = exp(1i*(angle+phase));

x = real(m);
y = imag(m);


end
