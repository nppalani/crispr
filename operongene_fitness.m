
function outdata = operongene_fitness(in_table)

%sort table by operonid - ascending
tempTable = sortrows(in_table,'operonid','ascend');

%find first occurences of unique values
[~,ia,~]=unique(tempTable.operonid);

%remove rows that have operonid value = 0. Necessary to run accumarray.
tempTable(ia(1):(ia(2)-1),:)=[];

%Find duplicate values i.e. operons with more than one gene represented in
%the data
nonUniqueValues = find( accumarray(tempTable.operonid, ones(size(tempTable.operonid))) > 1 );
[~,locb]=ismember(tempTable.operonid,nonUniqueValues);
k=1;
for i=1:length(locb)
    if locb(i)~=0
        newtab(k,:) = tempTable(i,:);
        k=k+1;
    end
end

outdata = newtab;
end
