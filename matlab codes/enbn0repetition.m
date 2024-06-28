clear;
bits= randi([0 1], 1, 24000);


codedbits3 = modrep3(bits);
codedbits5 = modrep5(bits);
codedbits7 = modrep7(bits);

qpsksymbols = qpsk(0,bits);
qpsk3symbols = qpsk(0,codedbits3);
qpsk5symbols = qpsk(0,codedbits5);
qpsk7symbols = qpsk(0,codedbits7);

qbitsrecovered1=deqpsk(qpsksymbols,0);
qbitsrecovered3 = deqpsk(qpsk3symbols,0);
qbitsrecovered5 = deqpsk(qpsk5symbols,0);
qbitsrecovered7 = deqpsk(qpsk7symbols,0);

qpskequalflag = isequal(qbitsrecovered1, bits)
qpsk3equalflag = isequal(qbitsrecovered3,codedbits3)
qpsk5equalflag = isequal(qbitsrecovered5,codedbits5)
qpsk7equalflag = isequal(qbitsrecovered7,codedbits7)

qpsk3errorcount = nan(1,50);
qpsk5errorcount = nan(1,50);
qpsk7errorcount = nan(1,50);
qerrorcount = nan(1,50);

for n = 1:50
    
    Ebno = n/3;
    snr = convertSNR(Ebno,"ebno",BitsPerSymbol=2);    

    qpsk3noised = awgn (qpsk3symbols,snr);
    qpsk5noised = awgn (qpsk5symbols,snr);
    qpsk7noised = awgn (qpsk7symbols,snr);
    qnoised = awgn(qpsksymbols,snr);  
    
    qpsk3bitsrecovered = deqpsk(qpsk3noised,0);
    qpsk5bitsrecovered = deqpsk(qpsk5noised,0);
    qpsk7bitsrecovered = deqpsk(qpsk7noised,0);
    qbitsrecovered=deqpsk(qnoised,0);
    
    qpsk3bitsreducted = demodrep3(qpsk3bitsrecovered);
    qpsk5bitsreducted = demodrep5(qpsk5bitsrecovered);
    qpsk7bitsreducted = demodrep7(qpsk7bitsrecovered);

    qpsk3errorcount(n) = sum(xor(qpsk3bitsreducted,bits));
    qpsk5errorcount(n) = sum(xor(qpsk5bitsreducted,bits));
    qpsk7errorcount(n) = sum(xor(qpsk7bitsreducted,bits));
    qerrorcount(n) = sum(xor(qbitsrecovered,bits));


end

m= 1:50;
semilogy(m/2,qerrorcount/24000, '*', 'DisplayName','QPSK Error Rate');
hold on;

semilogy(m/2,qpsk3errorcount/24000, '*', 'DisplayName','3 Rep QPSK Error Rate');
semilogy(m/2,qpsk5errorcount/24000, '*', 'DisplayName','5 Rep QPSK Error Rate');
semilogy(m/2,qpsk7errorcount/24000, '*', 'DisplayName','7 Rep QPSK Error Rate');

xlabel('Eb/n0');
ylabel('Error Rate');
title('BER Graph for No Rep, 3 Rep, 5 Rep and 7 Rep QPSK')
legend;
hold off;