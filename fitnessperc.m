function out_table = fitnessperc(in_table1,in_table2)

% calculating timedInd fitness as percentage of conInd fitness

% calculate gene fitness for each table. ie. map fitness to crisprid.
table1_genefit = calcgenefitness(in_table1);
table2_genefit = calcgenefitness(in_table2);

[C,ia,ib]=intersect(table1_genefit.crisprid,table2_genefit.crisprid);

out_table.crisprid = C;
out_table.confitness = table1_genefit.fitness(ia);
out_table.normfit = log2(1-((table2_genefit.fitness(ib)-table1_genefit.fitness(ia))./(1-table1_genefit.fitness(ia))));

   out_table = struct2table(out_table);

end