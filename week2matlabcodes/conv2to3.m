function codeddata = conv2to3(data)

trellis = poly2trellis([5 4],[23 35 0; 0 5 13]);
codeddata = convenc(data,trellis);

end