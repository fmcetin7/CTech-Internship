bits=randi([0 1],1,100000000);
%bits=ones(1,100000000);
%bits=zeros(1,100000000);
fec_type_input = 6;
mod_type_input=1;
packagenumber=100;
snr_sample_count=1;
rolloff = 0.5;
filterlength=10;
sps=4;

%snrs = [5, 0, -5, -10, -15, -20];
snrs= [3, 0, -3, -6, -9, -12];
m=0
[correlativeoutput1, detectrate1, errorrate1,detectcount1,errorcount1] = test(bits,fec_type_input,mod_type_input,packagenumber,snrs(1),snr_sample_count,rolloff,filterlength,sps);
m=m+1
[correlativeoutput2, detectrate2, errorrate2,detectcount2,errorcount2] = test(bits,fec_type_input,mod_type_input,packagenumber,snrs(2),snr_sample_count,rolloff,filterlength,sps);
m=m+1
[correlativeoutput3, detectrate3, errorrate3,detectcount3,errorcount3] = test(bits,fec_type_input,mod_type_input,packagenumber,snrs(3),snr_sample_count,rolloff,filterlength,sps);
m=m+1
[correlativeoutput4, detectrate4, errorrate4,detectcount4,errorcount4] = test(bits,fec_type_input,mod_type_input,packagenumber,snrs(4),snr_sample_count,rolloff,filterlength,sps);
m=m+1
[correlativeoutput5, detectrate5, errorrate5,detectcount5,errorcount5] = test(bits,fec_type_input,mod_type_input,packagenumber,snrs(5),snr_sample_count,rolloff,filterlength,sps);
m=m+1
[correlativeoutput6, detectrate6, errorrate6,detectcount6,errorcount6] = test(bits,fec_type_input,mod_type_input,packagenumber,snrs(6),snr_sample_count,rolloff,filterlength,sps);

detectrate = [detectrate1,detectrate2,detectrate3,detectrate4,detectrate5,detectrate6];
errorrate=[errorrate1,errorrate2,errorrate3,errorrate4,errorrate5,errorrate6];
detectcount=[detectcount1,detectcount2,detectcount3,detectcount4,detectcount5,detectcount6];
errorcount=[errorcount1,errorcount2,errorcount3,errorcount4,errorcount5,errorcount6];

maxLength = max([length(correlativeoutput1), length(correlativeoutput2), length(correlativeoutput3),length(correlativeoutput4), length(correlativeoutput5), length(correlativeoutput6)]);

correlativeoutput1 = [correlativeoutput1, zeros(1, maxLength - length(correlativeoutput1))];
correlativeoutput2 = [correlativeoutput2, zeros(1, maxLength - length(correlativeoutput2))];
correlativeoutput3 = [correlativeoutput3, zeros(1, maxLength - length(correlativeoutput3))];
correlativeoutput4 = [correlativeoutput4, zeros(1, maxLength - length(correlativeoutput4))];
correlativeoutput5 = [correlativeoutput5, zeros(1, maxLength - length(correlativeoutput5))];
correlativeoutput6 = [correlativeoutput6, zeros(1, maxLength - length(correlativeoutput6))];

correlativeoutput=[correlativeoutput1;correlativeoutput2;correlativeoutput3;correlativeoutput4;correlativeoutput5;correlativeoutput6];

for i = 1:6
    subplot(4,2,i);
    plot(correlativeoutput(i,:));
    hold on;
    plot(nan, nan, 'r'); 
    plot(nan, nan, 'r'); 
    xlabel('Bits');
    ylabel('Correlative Output');
    legend({['SNR: ', num2str(snrs(i)), ' dB'],... 
            ['Detection Rate: ', num2str(detectcount(i)),'/',num2str(packagenumber)],...
            ['Error Rate: ', num2str(errorcount(i)),'/',num2str(detectcount(i))]});
    hold off;
end

subplot(4,2,7);
plot(fliplr(snrs),fliplr(detectrate));
xlabel('SNR');
ylabel('Detect Rate');
%xlim([-21,6]);
xlim([-13,4]);
ylim([-0.2,1.2]);
subplot(4,2,8);
plot(fliplr(snrs),fliplr(errorrate));
xlabel('SNR');
ylabel('Error Rate');
%xlim([-21,6]);
xlim([-13,4]);
ylim([-0.2,1.2]);


