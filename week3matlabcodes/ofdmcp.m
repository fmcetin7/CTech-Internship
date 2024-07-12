% Parameters
nfft = 256; % Number of subcarriers
cpLength = 16; % Length of cyclic prefix
errorrate=nan(4,50);

for bps=1:4
    for snr = 1:50  
        bits = randi([0 1], 1, nfft*bps); % Random Modulated symbols
        % QAM Modulation
        symbols = modulation(bits, bps,0);
        
        % IFFT (OFDM Symbol Generation)
        ofdmsubcarriersraw = ifft(symbols, nfft);
    
        % Add Cyclic Prefix
        ofdmsubcarrierscp = [ofdmsubcarriersraw(end-cpLength+1:end), ofdmsubcarriersraw];
        
        % Transmission (through a hypothetical channel)
        receivedsignal = awgn(ofdmsubcarrierscp,snr); 
        
        % Remove Cyclic Prefix
        receivedsymbol = receivedsignal(cpLength+1:end);
        
        % FFT (OFDM Symbol Demodulation)
        receivedsubcarriers = fft(receivedsymbol, nfft);
        
        % QAM Demodulation
        receivedbits = demodulation(receivedsubcarriers, bps,0);
        errorrate(bps,snr)=sum(xor(bits,receivedbits))/nfft/bps;
    end
end
% Check if data symbols are correctly received
% isequal(receivedbits, bits)
% sum(xor(bits,receivedbits))

error1=errorrate(1,:);
error2=errorrate(2,:);
error3=errorrate(3,:);
error4=errorrate(4,:);
semilogy(error1,'*','DisplayName','bps=1');
hold on;
semilogy(error2,'*','DisplayName','bps=2');
semilogy(error3,'*','DisplayName','bps=3');
semilogy(error4,'*','DisplayName','bps=4');
legend;
hold off;
