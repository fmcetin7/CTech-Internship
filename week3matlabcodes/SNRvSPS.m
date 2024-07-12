mfilter = phased.MatchedFilter ;

filtlength = 20;
sps = 4;

rrcfilter = rcosdesign(0.5,filtlength,sps);
bits=randi([0 1],1,10002);

sym = modulation(bits,2,0);

txfiltsignal = upfirdn(sym,rrcfilter,sps,1);
matched_signal = mfilter(txfiltsignal);

snr = 10;

    rxSignal = awgn(txfiltsignal,snr,'measured');
    matched_rx_signal = mfilter(rxSignal);
    rxFiltSignal2 = upfirdn(matched_rx_signal,rrcfilter,1,sps); % Downsample and filter
    rxFiltSignal = rxFiltSignal2(filtlength + 1:end - filtlength); % Account for delay

    symout = demodulation(rxFiltSignal,2,0);
   % error1=sum(xor(symout,bits))

    x = awgn(sym,snr,'measured');

    x2=demodulation(x,2,0);
   % error2=sum(xor(x2,bits))

subplot(2,2,1);
plot(matched_rx_signal,'*');
hold on;
plot(rxSignal,'*');
plot (txfiltsignal,'*');
plot(rxFiltSignal,'*');
title('SPS=4 & SNR=10');
hold off;

mfilter = phased.MatchedFilter ;

filtlength = 20;
sps = 4;

rrcfilter = rcosdesign(0.5,filtlength,sps);
bits=randi([0 1],1,10002);

sym = modulation(bits,2,0);

txfiltsignal = upfirdn(sym,rrcfilter,sps,1);
matched_signal = mfilter(txfiltsignal);

snr = 1;

    rxSignal = awgn(txfiltsignal,snr,'measured');
    matched_rx_signal = mfilter(rxSignal);
    rxFiltSignal2 = upfirdn(matched_rx_signal,rrcfilter,1,sps); % Downsample and filter
    rxFiltSignal = rxFiltSignal2(filtlength + 1:end - filtlength); % Account for delay

    symout = demodulation(rxFiltSignal,2,0);
   % error1=sum(xor(symout,bits))

    x = awgn(sym,snr,'measured');

    x2=demodulation(x,2,0);
   % error2=sum(xor(x2,bits))


subplot(2,2,2);
plot(matched_rx_signal,'*');
hold on;
plot(rxSignal,'*');
plot (txfiltsignal,'*');
plot(rxFiltSignal,'*');
title('SPS=4 & SNR=1');
hold off;

mfilter = phased.MatchedFilter ;

filtlength = 20;
sps = 40;

rrcfilter = rcosdesign(0.5,filtlength,sps);
bits=randi([0 1],1,10002);

sym = modulation(bits,2,0);

txfiltsignal = upfirdn(sym,rrcfilter,sps,1);
matched_signal = mfilter(txfiltsignal);

snr = 10;

    rxSignal = awgn(txfiltsignal,snr,'measured');
    matched_rx_signal = mfilter(rxSignal);
    rxFiltSignal2 = upfirdn(matched_rx_signal,rrcfilter,1,sps); % Downsample and filter
    rxFiltSignal = rxFiltSignal2(filtlength + 1:end - filtlength); % Account for delay

    symout = demodulation(rxFiltSignal,2,0);
   % error1=sum(xor(symout,bits))

    x = awgn(sym,snr,'measured');

    x2=demodulation(x,2,0);
   % error2=sum(xor(x2,bits))

subplot(2,2,3);
plot(matched_rx_signal,'*');
hold on;
plot(rxSignal,'*');
plot (txfiltsignal,'*');
plot(rxFiltSignal,'*');
title('SPS=40 & SNR=10');
hold off;

mfilter = phased.MatchedFilter ;

filtlength = 20;
sps = 40;

rrcfilter = rcosdesign(0.5,filtlength,sps);
bits=randi([0 1],1,10002);

sym = modulation(bits,2,0);

txfiltsignal = upfirdn(sym,rrcfilter,sps,1);
matched_signal = mfilter(txfiltsignal);

snr = 1;

    rxSignal = awgn(txfiltsignal,snr,'measured');
    matched_rx_signal = mfilter(rxSignal);
    rxFiltSignal2 = upfirdn(matched_rx_signal,rrcfilter,1,sps); % Downsample and filter
    rxFiltSignal = rxFiltSignal2(filtlength + 1:end - filtlength); % Account for delay

    symout = demodulation(rxFiltSignal,2,0);
   % error1=sum(xor(symout,bits))

    x = awgn(sym,snr,'measured');

    x2=demodulation(x,2,0);
   % error2=sum(xor(x2,bits))


subplot(2,2,4);
plot(matched_rx_signal,'*');
hold on;
plot(rxSignal,'*');
plot (txfiltsignal,'*');
plot(rxFiltSignal,'*');
title('SPS=40 & SNR=1');
hold off;

