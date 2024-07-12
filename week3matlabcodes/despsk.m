function bits = despsk(z,phase);


ang = angle(z) - phase;

z = exp(ang*i);

distance = [z(:)-(exp(i*0)), z(:)-(exp(i*-pi/8)),z(:)-(exp(i*-3*pi/8)),z(:)-(exp(i*-pi/4)),z(:)-(exp(i*9*pi/8)),z(:)-(exp(i*5*pi/4)),z(:)-(exp(i*3*pi/2)),z(:)-(exp(i*11*pi/8)),z(:)-(exp(i*pi/8)),z(:)-(exp(i*pi/4)),z(:)-(exp(i*pi/2)),z(:)-(exp(i*3*pi/8)),z(:)-(exp(i*pi)),z(:)-(exp(i*7*pi/8)),z(:)-(exp(i*5*pi/8)),z(:)-(exp(i*3*pi/4)),];

[~, indices] = min(distance, [], 2);
bits = nan(1,4*length(z));

for n = 1:length(indices)
    if indices(n) == 1
        bits((4*n-3):4*n) = [0,0,0,0];
    elseif indices(n) == 2
        bits((4*n-3):4*n) = [0,0,0,1];
    elseif indices(n) == 3
        bits((4*n-3):4*n) = [0,0,1,0];
    elseif indices(n) == 4
        bits((4*n-3):4*n) = [0,0,1,1];
    elseif indices(n) == 5
        bits((4*n-3):4*n) = [0,1,0,0];
    elseif indices(n) == 6
        bits((4*n-3):4*n) = [0,1,0,1];
    elseif indices(n) == 7
        bits((4*n-3):4*n) = [0,1,1,0];
    elseif indices(n) == 8
        bits((4*n-3):4*n) = [0,1,1,1];
    elseif indices(n) == 9
        bits((4*n-3):4*n) = [1,0,0,0];
    elseif indices(n) == 10
        bits((4*n-3):4*n) = [1,0,0,1];
    elseif indices(n) == 11
        bits((4*n-3):4*n) = [1,0,1,0];
    elseif indices(n) == 12
        bits((4*n-3):4*n) = [1,0,1,1];
    elseif indices(n) == 13
        bits((4*n-3):4*n) = [1,1,0,0];
    elseif indices(n) == 14
        bits((4*n-3):4*n) = [1,1,0,1];
    elseif indices(n) == 15
        bits((4*n-3):4*n) = [1,1,1,0];
    elseif indices(n) == 16
        bits((4*n-3):4*n) = [1,1,1,1]; 
    end
end



end