function codeddata = conv1to3(data)

trellis = poly2trellis(3, [7,5,3]);
codeddata = convenc(data,trellis);

end