function filteredheader = transformheader(rolloff,filterlength,sps,headerbits)
% this function modulates&upsamples the header bits.

headersym = modulation(headerbits,1,0);

rcfilter = rcosdesign(rolloff,filterlength,sps);
filteredheader = upfirdn(headersym, rcfilter, sps, 1);
filteredheader = filteredheader(1:(30*sps));
filteredheader = real(filteredheader);
end