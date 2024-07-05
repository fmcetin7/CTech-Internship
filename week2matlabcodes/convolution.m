function codeddata = convolution(data,R)

if R == 1/3
    codeddata = conv1to3(data);
elseif R == 1/2
    codeddata = conv1to2(data);
elseif R == 2/3
    codeddata = con2to3(data);
end

end