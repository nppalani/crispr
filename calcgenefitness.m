function out_table = calcgenefitness(in_table)
% calculate fitness for each CRISPR as mean fitness of its barcodes

fitness =[in_table.fitness];
crisprid=[in_table.crisprid];
[uniqcrispr, ia,~]=unique(crisprid);
repli_count = countmember(uniqcrispr,crisprid);

libsize= length(uniqcrispr);
fitmean = zeros(libsize,1);

parfor i = 1:libsize
    bound1 = ia(i); bound2= ia(i)+(repli_count(i)-1);
    fitmean(i,1)= mean(fitness(bound1:bound2,1));
        
end

    out_table.crisprid = uniqcrispr;
    out_table.fitness = fitmean;
    out_table.numbarcodes = repli_count;
    out_table = struct2table(out_table);
    
    
end
