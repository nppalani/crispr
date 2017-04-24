function out_table=numbarc_compare(in_table1,in_table2)
% compare number of barcodes for each crispr common to two samples.
samp1 = calcgenefitness(in_table1);
samp2 = calcgenefitness(in_table2);

[C,ia,ib]= intersect(samp1.crisprid,samp2.crisprid);


out_table.crisprid = C;
out_table.s1fitness = samp1.fitness(ia);
out_table.s1numbarc = samp1.numbarcodes(ia);

out_table.s2fitness = samp2.fitness(ib);
out_table.s2numbarc = samp2.numbarcodes(ib);


out_table = struct2table(out_table);

end
