function codeddata = conv1to2(data)

trellis = poly2trellis(3,[6 7]);
codeddata = convenc(data,trellis);

end