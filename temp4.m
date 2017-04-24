

nonUniqueValues = find( accumarray(ccmr1op.operonid, ones(size(ccmr1op.operonid))) > 1 );
[~,locb]=ismember(ccmr1op.operonid,nonUniqueValues);
k=1;
for i=1:length(locb)
    if locb(i)~=0
        newtab(k,:) = ccmr1op(i,:);
        k=k+1;
    end
end


