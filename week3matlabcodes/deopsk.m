function bits = deopsk(z,phase);


ang = angle(z) - phase;

z = exp(ang*i);

distance = [z(:)-(-1-i)/sqrt(2), z(:)-(-1), z(:)-(i), z(:)-(-1+i)/sqrt(2), z(:)-(-i), z(:)-(1-i)/sqrt(2), z(:)-(1+i)/sqrt(2), z(:)-(1)];

[~, indices] = min(distance, [], 2);
bits = nan(1,3*length(z));

for n = 1:length(indices)
    if indices(n) == 1
        bits((3*n-2):3*n) = [0,0,0];
    elseif indices(n) == 2
        bits((3*n-2):3*n) = [0,0,1];
    elseif indices(n) == 3
        bits((3*n-2):3*n) = [0,1,0];
    elseif indices(n) == 4
        bits((3*n-2):3*n) = [0,1,1];
    elseif indices(n) == 5
        bits((3*n-2):3*n) = [1,0,0];
    elseif indices(n) == 6
        bits((3*n-2):3*n) = [1,0,1];
    elseif indices(n) == 7
        bits((3*n-2):3*n) = [1,1,0];
    elseif indices(n) == 8
        bits((3*n-2):3*n) = [1,1,1];
    end
end



end