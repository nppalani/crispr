function [out_table] = temp43(in_table)
tic

fitness =[in_table.fitness];
crisprid=[in_table.crisprid];
[uniqcrispr, ia,~]=unique(crisprid);
repli_count = countmember(uniqcrispr,crisprid);

libsize= length(uniqcrispr);
fitmean = zeros(libsize,1);

i=1:1:libsize;
bound1 = ia(i);
bound2= ia(i)+(repli_count(i)-1);

parfor m = 1:libsize
        fitmean(m,1)= mean(fitness(bound1(m):bound2(m),1));
        
end


    out_table.crisprid = uniqcrispr;
    out_table.fitness = fitmean;
    out_table = struct2table(out_table);
toc
end
