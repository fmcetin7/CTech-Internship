function decodeddata = deconvolution(codeddata,R)

if R == 1/3
    decodeddata = deconv1to3(codeddata);
elseif R == 1/2
    decodeddata = deconv1to2(codeddata);
elseif R == 2/3
    decodeddata = deconv2to3(codeddata);
end

end