snr = 3;
filterlength = 10;
sps = 6;
rolloff = 0.25;

mfilter = phased.MatchedFilter ;
rcfilter = rcosdesign(rolloff,filterlength,sps);

bits = randi([0 1], 1, 100000);
symbols = modulation(bits,2,0);

upsampled_signal = upfirdn(symbols, rcfilter, sps, 1);
matched_signal = mfilter(upsampled_signal);

noised_raw = awgn(symbols,snr,"measured");
noised_signal = awgn(matched_signal, snr, "measured");

x=modulation((zeros(1,100)),2,0);
noised_signal2 = [noised_signal,x];

matched_noised_signal = mfilter(noised_signal2)/2;
downsampled_signal_excess = upfirdn(matched_noised_signal,rcfilter,1,sps);
downsampled_signal = downsampled_signal_excess(filterlength+1 : end - filterlength);

receivedfilterbits = demodulation(downsampled_signal,2,0);
receivedrawbits = demodulation(noised_raw,2,0);

rawerror = sum(xor(receivedrawbits,bits))
filtererror = sum(xor(receivedfilterbits,bits))

plot(noised_raw,'*');
hold on;
plot(downsampled_signal,'*');
hold off;