
function out_table=bc_pvalcalc(in_table)
tic
%sort table by operonid - ascending
tempTable = sortrows(in_table,'crisprid','ascend');
crisprid=[tempTable.crisprid];
calcfitness =[tempTable.fitness];
SD_mccalc =[tempTable.SD_mccalc];


%find first occurences of unique values
[uniqcrispr,ia,~]=unique(tempTable.crisprid);
repli_count = countmember(uniqcrispr,crisprid);
matsize = max(repli_count);

libsize=length(uniqcrispr);

% formula to calculate number of off-diagonal elements in a upper triangular
% matrix
offdiag_num = (matsize*(matsize-1))/2;
out_table=zeros(libsize,offdiag_num);
for q = 1:libsize

 bound1 = ia(q); bound2= ia(q)+(repli_count(q)-1);
 numbc= repli_count(q);
 
 fit_dimv = calcfitness(bound1:bound2);
 sd_dimv = SD_mccalc(bound1:bound2);

 
 % Calculate p values for all bc combinations
 
 pvalmatrix=zeros(numbc);
 for i=1:numbc
     for j= 1:numbc
         % call ztestcalc to calculate p value
         pvalmatrix(i,j)=ztestcalc(fit_dimv(i,1),fit_dimv(j,1),sd_dimv(i,1),sd_dimv(j,1));
     end
 end
 
        upptrivals = nonzeros(triu(pvalmatrix,1)).';
        lenvec = length(upptrivals);
         out_table(q,1:lenvec)= upptrivals;
         
        

end
toc
end
