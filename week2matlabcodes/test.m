function errorrate = test(bits,fec_type_input,mod_type_input,packagenumber,snr_max,snr_sample_count)

%this function simulates the transmission of a data and returns a package
%error rate for given parameters

[mod_type,fec_type,bcpp] = prepup(fec_type_input,mod_type_input);

%packagenumber = floor(length(bits)/(bcpp - 24));
%uncomment top line and remove packagenumber as input from test function if
%you want to use maximum package count for your specific #bits.

errorrate = nan(1,snr_sample_count);
%prepare an empty array of errors by #snr 

for r = 1:(snr_sample_count)
    errorcount = 0;
    for i = 1:packagenumber
        usedbitswithoutcrc = bits((i*(bcpp-24)-bcpp+25):(i*(bcpp-24)));
        usedbits = crc(usedbitswithoutcrc);
        %obtain the used bits per each cycle of this for loop

        datapackage = packed(fec_type,mod_type,usedbits,i);
        %pack the usedbits to symbols

        datareceived = awgn(datapackage,(r/(snr_sample_count/snr_max)));
        %datareceived = datapackage;
        %uncomment top line and comment the line with awgn function if you
        %want to remove noise from test

        errorcount = updateerrorcount(datareceived,errorcount);
        %check for errors by looking at the symbols after noise
    end
    errorrate(r) = errorcount/packagenumber;
    %obtain final error rate
end

end

