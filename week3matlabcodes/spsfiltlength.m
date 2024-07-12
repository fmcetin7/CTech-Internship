snr = 1;
rolloff = 0.25;
bits = randi([0 1], 1, 10000);
symbols = modulation(bits,2,0);

filtererror = nan(10,20);
i=0;
for filterlength = 1:10
    filterlength = filterlength*2;
    for sps = 1:20

        mfilter = phased.MatchedFilter ;
        rcfilter = rcosdesign(rolloff,filterlength,sps);

        upsampled_signal = upfirdn(symbols, rcfilter, sps, 1);
        matched_signal = mfilter(upsampled_signal);
        noised_signal = awgn(matched_signal, snr, "measured");


        matched_noised_signal = mfilter(noised_signal)/2;
        downsampled_signal_excess = upfirdn(matched_noised_signal,rcfilter,1,sps);
        downsampled_signal = downsampled_signal_excess(filterlength+1 : end - filterlength);

        receivedfilterbits = demodulation(downsampled_signal,2,0);

        filtererror(filterlength/2,sps) = sum(xor(receivedfilterbits,bits));
        i=i+1
    end
end 

[x, y] = meshgrid(1:20, 1:10);
surf(x, y, filtererror);