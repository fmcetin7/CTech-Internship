function [matched_signal,mfilter] = upsample(symbols,rolloff,filterlength,sps)

mfilter = phased.MatchedFilter ;

rcfilter = rcosdesign(rolloff,filterlength,sps);

upsampled_signal = upfirdn(symbols, rcfilter, sps, 1);
matched_signal = mfilter(upsampled_signal);

end