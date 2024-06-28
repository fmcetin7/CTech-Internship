function bits = debpsk(z,phase);

bits = nan(1,length(z));

ang = angle(z) - phase;

z = exp(ang*i);

distance = [z(:)-1, z(:)+1];

[~, indices] = min(distance, [], 2);

for n = 1:length(indices)
    if indices(n) == 1
        bits(n)=0;
    elseif indices(n) == 2
        bits(n)=1;
    end
end

end