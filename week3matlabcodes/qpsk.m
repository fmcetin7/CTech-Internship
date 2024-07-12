function [m] = qpsk(phase,bits)

bits=bits(1: floor(length(bits)/2)*2);
bit_matrix = reshape(bits, 2, [])';
dimensions = size(bit_matrix);
rows = dimensions(1);

angle = nan(1, rows);

for n = 1:rows
    if isequal (bit_matrix(n,:), [0,0])
        angle(n) = 5*pi/4;
    elseif isequal (bit_matrix(n,:), [0,1])
        angle(n) = 3*pi/4;
    elseif isequal (bit_matrix(n,:), [1,0])
        angle(n) = -1*pi/4;
    elseif isequal (bit_matrix(n,:), [1,1])
        angle(n) = pi/4;
    end
end

m = exp(1i*(angle+phase));

end

