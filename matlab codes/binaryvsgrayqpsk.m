clear;
bits= randi([0 1], 1, 240000);

qpsksymbols = qpsk(0,bits);
qqpsksymbols = qqpsk(0,bits);

qbitsrecovered1=deqpsk(qpsksymbols,0);
qqbitsrecovered1=deqqpsk(qqpsksymbols,0);

qpskequalflag = isequal(qbitsrecovered1, bits)
qqpskequalflag = isequal(qqbitsrecovered1, bits)

qerrorcount = nan(1,50);
qqerrorcount = nan(1,50);

for n = 1:50

    qnoised = awgn(qpsksymbols,n);  
    qqnoised = awgn(qqpsksymbols,n);  
    
    qbitsrecovered=deqpsk(qnoised,0);
    qqbitsrecovered=deqqpsk(qqnoised,0);
   
    qerrorcount(n) = sum(xor(qbitsrecovered,bits));
    qqerrorcount(n) = sum(xor(qqbitsrecovered,bits));

end

m= 1:50;


semilogy(m,qerrorcount/240000, '*', 'DisplayName','Gray QPSK Error Rate');
hold on
semilogy(m,qqerrorcount/240000, '*', 'DisplayName','Binary QPSK Error Rate');

title('Gray Mapping vs Binary Mapping BER')
legend;
hold off;