
function [correlativeoutput, detectrate, errorrate,detectcount,errorcount] = test(bits,fec_type_input,mod_type_input,packagenumber,snr_max,snr_sample_count,rolloff,filterlength,sps)

%this function simulates the transmission of a data and returns a package
%error rate for given parameters

headerbits = goldcodegenerator();
% Create a goldcoded header sequence for detection

[mod_type,fec_type,bcpp] = prepup(fec_type_input,mod_type_input);
%prepare the parameters and calculate bit count per package

if packagenumber==0
    packagenumber = floor(length(bits)/(bcpp - 24));
end

detectrate = nan(1,snr_sample_count);
errorrate = nan(1,snr_sample_count);

x=modulation((zeros(1,2000)),2,0);
[x,~] = upsample(x,rolloff,filterlength,sps);
%x will disrupt the data

for r = 1:(snr_sample_count)
    errorcount = 0;
    detectcount = 0;
    obtainedbits=[];
    for i = 1:packagenumber
        usedbitswithoutcrc = bits((i*(bcpp-24)-bcpp+25):(i*(bcpp-24)));
        usedbits = crc(usedbitswithoutcrc);
        %obtain the used bits per each cycle of this for loop

        datapackage = packed(fec_type,mod_type,usedbits,i,headerbits);
        %pack the usedbits to symbols
        
        [matched_signal,mfilter] = upsample(datapackage,rolloff,filterlength,sps);
        %upsample and rrcfilter the datapackage

        datareceived = awgn(matched_signal,(r/(snr_sample_count/snr_max)),"measured");
        % datareceived = matched_signal;
        %uncomment top line and comment the line with awgn function if you
        %want to remove noise from test

        header = transformheader(rolloff,filterlength,sps,headerbits);
        % obtain the header's modulated &upmsampled version

        datadisrupted=[x,datareceived,x];
        % disrupt the data with x

        [datadetected,check] = detectheader(datadisrupted,(1113*sps + sps*filterlength + 1),header);
        %detect the header and find the original datapackage also get a
        %check for detecting the package start correctly

        downsampled_signal = downsample(datadetected,rolloff,filterlength,sps,mfilter);
        %rrcfilter and downsample the received data

        [finalizedbits] = finalizebits(downsampled_signal);
        rawbitswithoutheader = finalizedbits(65:end);
        % get your finalizde received bits

        obtainedbits=[obtainedbits,finalizedbits];
        % gather obtained bits for all the packages of a certain SNR value

        if check == true
            detectcount=detectcount+1;
            if  not (checkcrc24(rawbitswithoutheader))
                errorcount = errorcount+1;
            end  
        end
        % error and detection alghoritms
    end
    errorrate(r) = errorcount/detectcount;
    detectrate(r) = detectcount/packagenumber;
    %obtain final detect&error rate
end

correlativeoutput=calculatecorr(obtainedbits,headerbits);
% calculate the correlation output of all the obtinedbits with header

end

