function out_table = revisefitness(in_table)

% calculate fitness by new formula fit = log(t2/t1 * d)/log(t2wt/t1wt *d)

randmean_denom = randommean_denom(in_table);

%expansion factor
expfac =4;


normt1 =[in_table.normcountt1];
normt2 =[in_table.normcountt2];



randcrisp_normfit = log(randmean_denom*expfac);


fitness = (log((normt2./normt1).*expfac))./randcrisp_normfit;

in_table.fitness = fitness;



out_table = in_table;
end