function [actualdata,detected] = detectheader(longdata,actualdatalength,header)
%this function takes a long data and the original datalength as inputs. It
%detects the header of the original data and then returns the original
%data by using correlation.


iterationnumber = floor((length(longdata)-length(header))/length(header));
values = nan(1,iterationnumber);
indices= nan(1,iterationnumber);
correlation = nan(1,iterationnumber*length(header));

for n = 1:iterationnumber
    currentbits = real(longdata((n-1)*length(header)+1:(n+1)*length(header)));
    power = mean(abs(currentbits).^2);
    y = xcorr(header,currentbits)/power;
    y=fliplr(y);
    y2=(y(end-length(currentbits)+1:end));
    [max_value, index] = max(y2);
    values(n) = max_value;
    indices(n) = index;
    correlation((n-1)*length(header)+1:n*length(header))=y2(1:length(header));
end

[~, index2] = max(correlation);
if index2 == 4038
    detected = true;
else
    detected = false;
end

[~, sorted_indices] = sort(values, 'descend');
for n = 1:length(values)
    datastart = (sorted_indices(n)-1)*length(header)+indices(sorted_indices(n));
    if datastart+actualdatalength < length(longdata)
        break
    end
end

actualdata = longdata(datastart:(datastart+actualdatalength-1));

end