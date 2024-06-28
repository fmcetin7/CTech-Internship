clear;xx
bits= randi([0 1], 1, 240000);

bpsksymbols = bpsk(0,bits);
qpsksymbols = qpsk(0,bits);
opsksymbols = opsk(0,bits);
spsksymbols = spsk(0,bits);

bbitsrecovered1=debpsk(bpsksymbols,0);
qbitsrecovered1=deqpsk(qpsksymbols,0);
obitsrecovered1=deopsk(opsksymbols,0);
sbitsrecovered1=despsk(spsksymbols,0);

bpskequalflag = isequal(bbitsrecovered1, bits)
qpskequalflag = isequal(qbitsrecovered1, bits)
opskequalflag = isequal(obitsrecovered1, bits)
spskequalflag = isequal(sbitsrecovered1, bits)

% bpskpow=mean(abs(bpsksymbols).^2);
% qpskpow=mean(abs(qpsksymbols).^2);
% opskpow=mean(abs(opsksymbols).^2);
% spskpow=mean(abs(spsksymbols).^2);

berrorcount = nan(1,50);
qerrorcount = nan(1,50);
oerrorcount = nan(1,50);
serrorcount = nan(1,50);

for n = 1:50

    Ebno = n;

    snr = convertSNR(Ebno,"ebno",BitsPerSymbol=1);
    bnoised = awgn(bpsksymbols,snr);

    snr = convertSNR(Ebno,"ebno",BitsPerSymbol=2);
    qnoised = awgn(qpsksymbols,snr);
    
    snr = convertSNR(Ebno,"ebno",BitsPerSymbol=3);
    onoised = awgn(opsksymbols,snr);

    snr = convertSNR(Ebno,"ebno",BitsPerSymbol=4);
    snoised = awgn(spsksymbols,snr);
    
    bbitsrecovered=debpsk(bnoised,0);
    qbitsrecovered=deqpsk(qnoised,0);
    obitsrecovered=deopsk(onoised,0);
    sbitsrecovered=despsk(snoised,0);
    
    berrorcount(n) = sum(xor(bbitsrecovered,bits));
    qerrorcount(n) = sum(xor(qbitsrecovered,bits));
    oerrorcount(n) = sum(xor(obitsrecovered,bits));
    serrorcount(n) = sum(xor(sbitsrecovered,bits));

end

m= 1:50;

semilogy(m,berrorcount/240000, '*', 'DisplayName','BPSK Error Rate');
hold on;
semilogy(m,qerrorcount/240000, '*', 'DisplayName','QPSK Error Rate');
semilogy(m,oerrorcount/240000, '*', 'DisplayName','8PSK Error Rate');
semilogy(m,serrorcount/240000, '*', 'DisplayName','16PSK Error Rate');

xlabel('Eb/n0');
ylabel('Error Rate');
title('BER Graph for BPSK vs QPSK vs 8PSK vs 16PSK')
legend;
hold off;