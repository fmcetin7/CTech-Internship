function correlativeoutput = calculatecorr(longdata,header)

correlativeoutput=nan(1,length(longdata));
iterationnumber = floor((length(longdata)-length(header))/length(header));
leftover = longdata((iterationnumber+1)*length(header)+1:end);
values = nan(1,iterationnumber);
indices= nan(1,iterationnumber);
correlation = nan(1,iterationnumber*length(header));

longdata = [longdata,zeros(1,(length(header)-length(leftover)))];
for n = 1:iterationnumber
    currentbits = real(longdata((n-1)*length(header)+1:(n+1)*length(header)));
    power = mean(abs(currentbits).^2);
    y = xcorr(header,currentbits)/power;
    y=fliplr(y);
    y2=(y(end-length(currentbits)+1:end));
    [max_value, index] = max(y2);
    values(n) = max_value;
    indices(n) = index;
    correlation((n-1)*length(header)+1:(n+1)*length(header))=y2;
end

correlativeoutput(1:length(correlation))=real(correlation);

end