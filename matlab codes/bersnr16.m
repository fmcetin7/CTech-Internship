clear;
bits= randi([0 1], 1, 24000);


codedbits3 = modrep3(bits);
codedbits5 = modrep5(bits);
codedbits7 = modrep7(bits);


bpsksymbols = bpsk(0,bits);
bpsk3symbols = bpsk(0,codedbits3);
bpsk5symbols = bpsk(0,codedbits5);
bpsk7symbols = bpsk(0,codedbits7);

qpsksymbols = qpsk(0,bits);
qpsk3symbols = qpsk(0,codedbits3);
qpsk5symbols = qpsk(0,codedbits5);
qpsk7symbols = qpsk(0,codedbits7);

opsksymbols = opsk(0,bits);
opsk3symbols = opsk(0,codedbits3);
opsk5symbols = opsk(0,codedbits5);
opsk7symbols = opsk(0,codedbits7);

spsksymbols = spsk(0,bits);
spsk3symbols = spsk(0,codedbits3);
spsk5symbols = spsk(0,codedbits5);
spsk7symbols = spsk(0,codedbits7);


bbitsrecovered1= debpsk(bpsksymbols,0);
bbitsrecovered3 = debpsk(bpsk3symbols,0);
bbitsrecovered5 = debpsk(bpsk5symbols,0);
bbitsrecovered7 = debpsk(bpsk7symbols,0);

qbitsrecovered1= deqpsk(qpsksymbols,0);
qbitsrecovered3 = deqpsk(qpsk3symbols,0);
qbitsrecovered5 = deqpsk(qpsk5symbols,0);
qbitsrecovered7 = deqpsk(qpsk7symbols,0);

obitsrecovered1= deopsk(opsksymbols,0);
obitsrecovered3 = deopsk(opsk3symbols,0);
obitsrecovered5 = deopsk(opsk5symbols,0);
obitsrecovered7 = deopsk(opsk7symbols,0);

sbitsrecovered1= despsk(spsksymbols,0);
sbitsrecovered3 = despsk(spsk3symbols,0);
sbitsrecovered5 = despsk(spsk5symbols,0);
sbitsrecovered7 = despsk(spsk7symbols,0);


bpskequalflag = isequal(bbitsrecovered1, bits)
bpsk3equalflag = isequal(bbitsrecovered3,codedbits3)
bpsk5equalflag = isequal(bbitsrecovered5,codedbits5)
bpsk7equalflag = isequal(bbitsrecovered7,codedbits7)

qpskequalflag = isequal(qbitsrecovered1, bits)
qpsk3equalflag = isequal(qbitsrecovered3,codedbits3)
qpsk5equalflag = isequal(qbitsrecovered5,codedbits5)
qpsk7equalflag = isequal(qbitsrecovered7,codedbits7)

opskequalflag = isequal(obitsrecovered1, bits)
opsk3equalflag = isequal(obitsrecovered3,codedbits3)
opsk5equalflag = isequal(obitsrecovered5,codedbits5)
opsk7equalflag = isequal(obitsrecovered7,codedbits7)

spskequalflag = isequal(sbitsrecovered1, bits)
spsk3equalflag = isequal(sbitsrecovered3,codedbits3)
spsk5equalflag = isequal(sbitsrecovered5,codedbits5)
spsk7equalflag = isequal(sbitsrecovered7,codedbits7)

bpsk3errorcount = nan(1,50);
bpsk5errorcount = nan(1,50);
bpsk7errorcount = nan(1,50);
berrorcount = nan(1,50);

qpsk3errorcount = nan(1,50);
qpsk5errorcount = nan(1,50);
qpsk7errorcount = nan(1,50);
qerrorcount = nan(1,50);

opsk3errorcount = nan(1,50);
opsk5errorcount = nan(1,50);
opsk7errorcount = nan(1,50);
oerrorcount = nan(1,50);

spsk3errorcount = nan(1,50);
spsk5errorcount = nan(1,50);
spsk7errorcount = nan(1,50);
serrorcount = nan(1,50);

for n = 1:50
    
    bpsk3noised = awgn (bpsk3symbols,n/2);
    bpsk5noised = awgn (bpsk5symbols,n/2);
    bpsk7noised = awgn (bpsk7symbols,n/2);
    bnoised = awgn(bpsksymbols,n/2);  
    
    qpsk3noised = awgn (qpsk3symbols,n/2);
    qpsk5noised = awgn (qpsk5symbols,n/2);
    qpsk7noised = awgn (qpsk7symbols,n/2);
    qnoised = awgn(qpsksymbols,n/2);  

    opsk3noised = awgn (opsk3symbols,n/2);
    opsk5noised = awgn (opsk5symbols,n/2);
    opsk7noised = awgn (opsk7symbols,n/2);
    onoised = awgn(opsksymbols,n/2);  
    
    spsk3noised = awgn (spsk3symbols,n/2);
    spsk5noised = awgn (spsk5symbols,n/2);
    spsk7noised = awgn (spsk7symbols,n/2);
    snoised = awgn(spsksymbols,n/2);  
    
    
    bpsk3bitsrecovered = debpsk(bpsk3noised,0);
    bpsk5bitsrecovered = debpsk(bpsk5noised,0);
    bpsk7bitsrecovered = debpsk(bpsk7noised,0);
    bbitsrecovered=debpsk(bnoised,0);
    
    qpsk3bitsrecovered = deqpsk(qpsk3noised,0);
    qpsk5bitsrecovered = deqpsk(qpsk5noised,0);
    qpsk7bitsrecovered = deqpsk(qpsk7noised,0);
    qbitsrecovered=deqpsk(qnoised,0);
    
    opsk3bitsrecovered = deopsk(opsk3noised,0);
    opsk5bitsrecovered = deopsk(opsk5noised,0);
    opsk7bitsrecovered = deopsk(opsk7noised,0);
    obitsrecovered=deopsk(onoised,0);

    spsk3bitsrecovered = despsk(spsk3noised,0);
    spsk5bitsrecovered = despsk(spsk5noised,0);
    spsk7bitsrecovered = despsk(spsk7noised,0);
    sbitsrecovered=despsk(snoised,0);
    

    bpsk3bitsreducted = demodrep3(bpsk3bitsrecovered);
    bpsk5bitsreducted = demodrep5(bpsk5bitsrecovered);
    bpsk7bitsreducted = demodrep7(bpsk7bitsrecovered);

    qpsk3bitsreducted = demodrep3(qpsk3bitsrecovered);
    qpsk5bitsreducted = demodrep5(qpsk5bitsrecovered);
    qpsk7bitsreducted = demodrep7(qpsk7bitsrecovered);

    opsk3bitsreducted = demodrep3(opsk3bitsrecovered);
    opsk5bitsreducted = demodrep5(opsk5bitsrecovered);
    opsk7bitsreducted = demodrep7(opsk7bitsrecovered);

    spsk3bitsreducted = demodrep3(spsk3bitsrecovered);
    spsk5bitsreducted = demodrep5(spsk5bitsrecovered);
    spsk7bitsreducted = demodrep7(spsk7bitsrecovered);


    bpsk3errorcount(n) = sum(xor(bpsk3bitsreducted,bits));
    bpsk5errorcount(n) = sum(xor(bpsk5bitsreducted,bits));
    bpsk7errorcount(n) = sum(xor(bpsk7bitsreducted,bits));
    berrorcount(n) = sum(xor(bbitsrecovered,bits));
   
    qpsk3errorcount(n) = sum(xor(qpsk3bitsreducted,bits));
    qpsk5errorcount(n) = sum(xor(qpsk5bitsreducted,bits));
    qpsk7errorcount(n) = sum(xor(qpsk7bitsreducted,bits));
    qerrorcount(n) = sum(xor(qbitsrecovered,bits));

    opsk3errorcount(n) = sum(xor(opsk3bitsreducted,bits));
    opsk5errorcount(n) = sum(xor(opsk5bitsreducted,bits));
    opsk7errorcount(n) = sum(xor(opsk7bitsreducted,bits));
    oerrorcount(n) = sum(xor(obitsrecovered,bits));

    spsk3errorcount(n) = sum(xor(spsk3bitsreducted,bits));
    spsk5errorcount(n) = sum(xor(spsk5bitsreducted,bits));
    spsk7errorcount(n) = sum(xor(spsk7bitsreducted,bits));
    serrorcount(n) = sum(xor(sbitsrecovered,bits));

end

m= 1:50;
semilogy(m/2,qerrorcount/24000, '*', 'DisplayName','QPSK Error Rate'),'r';
hold on;

semilogy(m/2,qpsk3errorcount/24000, '*', 'DisplayName','3 Rep QPSK Error Rate');
semilogy(m/2,qpsk5errorcount/24000, '*', 'DisplayName','5 Rep QPSK Error Rate');
semilogy(m/2,qpsk7errorcount/24000, '*', 'DisplayName','7 Rep QPSK Error Rate');

semilogy(m/2,berrorcount/24000, '*', 'DisplayName','BPSK Error Rate');
semilogy(m/2,bpsk3errorcount/24000, '*', 'DisplayName','3 Rep BPSK Error Rate');
semilogy(m/2,bpsk5errorcount/24000, '*', 'DisplayName','5 Rep BPSK Error Rate');
semilogy(m/2,bpsk7errorcount/24000, '*', 'DisplayName','7 Rep BPSK Error Rate');

semilogy(m/2,oerrorcount/24000, '*', 'DisplayName','8PSK Error Rate');
semilogy(m/2,opsk3errorcount/24000, '*', 'DisplayName','3 Rep 8PSK Error Rate');
semilogy(m/2,opsk5errorcount/24000, '*', 'DisplayName','5 Rep 8PSK Error Rate');
semilogy(m/2,opsk7errorcount/24000, '*', 'DisplayName','7 Rep 8PSK Error Rate');

semilogy(m/2,spsk3errorcount/24000, '*', 'DisplayName','3 Rep 16PSK Error Rate');
semilogy(m/2,spsk5errorcount/24000, '*', 'DisplayName','5 Rep 16PSK Error Rate');
semilogy(m/2,spsk7errorcount/24000, '*', 'DisplayName','7 Rep 16PSK Error Rate');
semilogy(m/2,serrorcount/24000, '*', 'DisplayName','16PSK Error Rate');

xlabel('SNR');
ylabel('Error Rate');
title('BER Graph Everything')
legend;
hold off;