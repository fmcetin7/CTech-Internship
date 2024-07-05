function decodeddata = deconv2to3(codeddata)

trellis = poly2trellis([5 4],[23 35 0; 0 5 13]);
tbdepth = 10;
decodeddata = vitdec(codeddata,trellis,tbdepth,'trunc','hard');

end