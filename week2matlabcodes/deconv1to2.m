function decodeddata = deconv1to2(codeddata)

trellis = poly2trellis(3,[6 7]);
tbdepth = 10;
decodeddata = vitdec(codeddata,trellis,tbdepth,'trunc','hard');

end