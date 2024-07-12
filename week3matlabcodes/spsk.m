function [m] = spsk(phase,bits)

bits=bits(1: floor(length(bits)/4)*4);

bits=bits(1: floor(length(bits)/4)*4);

bit_matrix = reshape(bits, 4, [])';
dimensions = size(bit_matrix);
rows = dimensions(1);

angle = nan(1, rows);


for n = 1:rows
    if isequal (bit_matrix(n,:), [0,0,0,0])
        angle(n) = 0;
    elseif isequal (bit_matrix(n,:), [0,0,0,1])
        angle(n) = -pi/8;
    elseif isequal (bit_matrix(n,:), [0,0,1,0])
        angle(n) = -3*pi/8;
    elseif isequal (bit_matrix(n,:), [0,0,1,1])
        angle(n) = -pi/4;
    elseif isequal (bit_matrix(n,:), [0,1,0,0])
        angle(n) = 9*pi/8;
    elseif isequal (bit_matrix(n,:), [0,1,0,1])
        angle(n) = 5*pi/4;
    elseif isequal (bit_matrix(n,:), [0,1,1,0])
        angle(n) = -pi/2;
    elseif isequal (bit_matrix(n,:), [0,1,1,1])
        angle(n) = -5*pi/8;
    elseif isequal (bit_matrix(n,:), [1,0,0,0])
        angle(n) = pi/8;
    elseif isequal (bit_matrix(n,:), [1,0,0,1])
        angle(n) = pi/4;
    elseif isequal (bit_matrix(n,:), [1,0,1,0])
        angle(n) = pi/2;
    elseif isequal (bit_matrix(n,:), [1,0,1,1])
        angle(n) = 3*pi/8;
    elseif isequal (bit_matrix(n,:), [1,1,0,0])
        angle(n) = pi;
    elseif isequal (bit_matrix(n,:), [1,1,0,1])
        angle(n) = 7*pi/8;
    elseif isequal (bit_matrix(n,:), [1,1,1,0])
        angle(n) = 5*pi/8;
    elseif isequal (bit_matrix(n,:), [1,1,1,1])
        angle(n) = 3*pi/4;
    end
end

m = exp(1i*(angle+phase));

x = real(m);
y = imag(m);
end
