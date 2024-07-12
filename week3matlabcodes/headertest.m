bits=randi([0 1],1,1000000);

header1=[ones(1,15),zeros(1,15)];
header2=[zeros(1,15),ones(1,15)];
header3=[ones(1,30)];
header4=[zeros(1,30)];
header5=[1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 ];
header6=[0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 ];
header7=[zeros(1,10),ones(1,10),zeros(1,10)];
header8=[ones(1,10),zeros(1,10),ones(1,10)];
header9=randi([0 1],1,30);
m=0
error1=test(bits,3,1,300,2,20,0.25,10,4,header1);
m=m+1
error2=test(bits,3,1,300,2,20,0.25,10,4,header2);
m=m+1
error3=test(bits,3,1,300,2,20,0.25,10,4,header3);
m=m+1
error4=test(bits,3,1,300,2,20,0.25,10,4,header4);
m=m+1
error5=test(bits,3,1,300,2,20,0.25,10,4,header5);
m=m+1
error6=test(bits,3,1,300,2,20,0.25,10,4,header6);
m=m+1
error7=test(bits,3,1,300,2,20,0.25,10,4,header7);
m=m+1
error8=test(bits,3,1,300,2,20,0.25,10,4,header8);
m=m+1
error9=test(bits,3,1,300,2,20,0.25,10,4,header9);

m=(1:20)/10;

plot(m,error1,'*','DisplayName','header1');
hold on;
plot(m,error2,'*','DisplayName','header2');
plot(m,error3,'*','DisplayName','header3');
plot(m,error4,'*','DisplayName','header4');
plot(m,error5,'*','DisplayName','header5');
plot(m,error6,'*','DisplayName','header6');
plot(m,error7,'*','DisplayName','header7');
plot(m,error8,'*','DisplayName','header8');
plot(m,error9,'*','DisplayName','header9');
legend;
xlabel('SNR');
ylabel('Package Error Rate');
hold off;

sums = [sum(error1),sum(error2),sum(error3),sum(error4),sum(error5),sum(error6),sum(error7),sum(error8),sum(error9)];
avg=sums/20