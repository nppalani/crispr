
function csvinput=bcreadcounts(infile,cutoffval)

%Function takes a CSV file containing data of the format
%crisprseq,barcodeseq and returns a structure that contains crispr, barcode
%and the number of reads associated with the barcode. Assumption: Each
%barcode is associated with one & only one crispr. Inputs for function are
%filename and minimum reads to retain entry.

%Dependencies: unique.m (Matlab) & countmember.m (MatlabExchange)

% read csvfile into table
inputTable = readtable(infile,'ReadVariableNames',false);
inputTable.Properties.VariableNames{1} = 'crispr';
inputTable.Properties.VariableNames{2} = 'barcode';

% find unique values of barcodes
[C,ia,~] = unique(inputTable.barcode);

% return readcounts of unique barcodes
countmem = countmember(C,inputTable.barcode);
totalreads = sum(countmem);
% Create temporary output structure
csvinput_temp(length(C))=struct();
    for i=1:length(C)
        csvinput_temp(i).barcode = C(i);
        csvinput_temp(i).crispr = inputTable.crispr(ia(i));
        csvinput_temp(i).count = countmem(i);
        csvinput_temp(i).normcount = countmem(i)/totalreads;
    end
    
%sort structure by readcounts in descending order
[~,index] = sortrows([csvinput_temp.count].'); 
csvinput_temp = csvinput_temp(index(end:-1:1)); 


% find the first row of occurence for readnumber cutoff
temptable=struct2table(csvinput_temp);
[Q,iq,~]=unique(temptable.count);

k=0;
for j=1:length(Q)
    if isequal(Q(j),cutoffval-1)==1
        k=iq(j);
        break;
    end
end

% delete rows for which reads are less than cutoff value (dependent on
% sort)
csvinput_temp(k:end)=[];

%output
csvinput = csvinput_temp;
%structname='csvinput_temp';

% outmatname = infile(1:(end-4));
% outfile=[outmatname '.mat'];
% 
% save (outfile,structname);

end
