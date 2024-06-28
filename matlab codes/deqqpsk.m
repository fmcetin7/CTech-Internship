function bits = deqqpsk(z,phase);


ang = angle(z) - phase;

z = exp(ang*i);

distance = [z(:)-(-1-i)/sqrt(2), z(:)-(-1+i)/sqrt(2), z(:)-(1-i)/sqrt(2), z(:)-(1+i)/sqrt(2)];

[~, indices] = min(distance, [], 2);
bits = nan(1,2*length(z));

for n = 1:length(indices)
    if indices(n) == 1
        bits((2*n-1):2*n) = [0,0];
    elseif indices(n) == 2
        bits((2*n-1):2*n) = [0,1];
    elseif indices(n) == 3
        bits((2*n-1):2*n) = [1,1];
    elseif indices(n) == 4
        bits((2*n-1):2*n) = [1,0];
    end
end



end