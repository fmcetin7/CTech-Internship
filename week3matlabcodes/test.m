
function errorrate = test(bits,fec_type_input,mod_type_input,packagenumber,snr_max,snr_sample_count,rolloff,filterlength,sps,headerbits)

%this function simulates the transmission of a data and returns a package
%error rate for given parameters

[mod_type,fec_type,bcpp] = prepup(fec_type_input,mod_type_input);

if packagenumber==0
    packagenumber = floor(length(bits)/(bcpp - 24));
end

errorrate = nan(1,snr_sample_count);
%prepare an empty array of errors by #snr 

x=modulation((ones(1,2000)),2,0);
[x,~] = upsample(x,rolloff,filterlength,sps);
%distrupt the data

for r = 1:(snr_sample_count)
    errorcount = 0;
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
        
        datadetected = detectheader(datadisrupted,(1113*sps + sps*filterlength + 1),header);
        %detect the header and find the original datapackage

        downsampled_signal = downsample(datadetected,rolloff,filterlength,sps,mfilter);
        %rrcfilter and downsample the received data

        errorcount = updateerrorcount(downsampled_signal,errorcount);
        %check for errors by looking at the symbols after noise
    end
    errorrate(r) = errorcount/packagenumber;
    %obtain final error rate
end

end

