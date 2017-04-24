
function [out_table,commoncrispr]=bc_pvalcalc2samples(in_table1,in_table2)
tic
%sort table by crisprid - ascending
tempTable1 = sortrows(in_table1,'crisprid','ascend');
crisprid1=[tempTable1.crisprid];
calcfitness1 =[tempTable1.fitness];
SD_mccalc1 =[tempTable1.SD_mccalc];


tempTable2 = sortrows(in_table2,'crisprid','ascend');
crisprid2=[tempTable2.crisprid];
calcfitness2 =[tempTable2.fitness];
SD_mccalc2 =[tempTable2.SD_mccalc];


%find first occurences of common unique values
[commoncrispr,ia,ib]=intersect(crisprid1,crisprid2);
repli_count1 = countmember(commoncrispr,crisprid1);
repli_count2 = countmember(commoncrispr,crisprid2);

% get the max number of barcodes per crispr in each condition and set it as
% output matrix size.

matsize = max(repli_count1)*max(repli_count2);

libsize=length(commoncrispr);

out_table=zeros(libsize,matsize);

% Loop to process barcodes for each CRISPR
for q = 1:libsize

    % set boundaries for pulling out barcodes for each crispr
 bound1up = ia(q); bound1low= ia(q)+(repli_count1(q)-1);
 
 bound2up = ib(q); bound2low= ib(q)+(repli_count2(q)-1);
 
 %set count for outer loop
 numbc1= repli_count1(q);
 
 %set count for inner loop
 numbc2= repli_count2(q);
 
 % Pull fitness & MC SD values for all barcodes of a CRISPR
 fit_dimv1 = calcfitness1(bound1up:bound1low);
 sd_dimv1 = SD_mccalc1(bound1up:bound1low);
 
 fit_dimv2 = calcfitness2(bound2up:bound2low);
 sd_dimv2 = SD_mccalc2(bound2up:bound2low);

 
 % Calculate p values for all bc combinations
 
 % Declare matrix size for each gene. Set matrix size as MxM where M is the max
 % of the number of barcodes per gene between the two conditions. 
 pvalmatrix=zeros(numbc1,numbc2);
 
 % Fill the matrix with p values
 for i=1:numbc1
     for j= 1:numbc2
         % call ztestcalc to calculate p value
         pvalmatrix(i,j)=ztestcalc(fit_dimv1(i,1),fit_dimv2(j,1),sd_dimv1(i,1),sd_dimv2(j,1));
     end
 end
        % get upper triangle of matrix, including diagonal
       matrixvals = nonzeros(pvalmatrix).';
        lenvec = length(matrixvals);
        
        out_table(q,1:lenvec)= matrixvals;
        
        

end


toc
end
