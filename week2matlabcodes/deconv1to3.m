function decodeddata = deconv1to3(codeddata)

trellis = poly2trellis(3, [7,5,3]);
tbdepth = 10;
decodeddata = vitdec(codeddata,trellis,tbdepth,'trunc','hard');

end