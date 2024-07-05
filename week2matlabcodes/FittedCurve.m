bits = randi([0 1],1,10000000);

conv1to3_2 = package(bits,6,1);
rep3_2 = package(bits,3,1);

i = 1:20;
i_2 = i/2;

plot (i_2,conv1to3_2,'*','DisplayName','1 to 3 Convolution');
hold on;
plot (i_2,rep3_2,'*','DisplayName','Repetition by 1/3');
xlabel('SNR');
ylabel('Package Error Rate');
legend;
title('Package Error Rate for QPSK with different FEC');
hold off;

[xData, yData] = prepareCurveData( i_2, conv1to3_2 );
[xData2, yData2] = prepareCurveData( i_2, rep3_2 );

ft = fittype( 'logistic' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [1 -1.13647771248898 3.4787228964132];

ft2 = fittype( 'logistic' );
opts2 = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts2.Display = 'Off';
opts2.StartPoint = [1 -0.934920572621086 5.1217771769398];


[fitresult, gof] = fit( xData, yData, ft, opts );
[fitresult2, gof2] = fit( xData2, yData2, ft2, opts2 );

plot(xData,yData,'r.');
hold on;
plot(fitresult,'r');
plot(xData2,yData2,'b.');
plot(fitresult2,'b');
hold off;

xlabel( 'SNR' );
ylabel( 'Package Error Rate' );
legend('1 to 3 Convolution','Fitted Curve','1 to 3 Repetition','Fitted Curve');
title('Package Error Rate for different FECs using QPSK')
