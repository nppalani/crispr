function denom_out=randommean_denom(in_table)

% Calculate the denominator from the random crisprs. Sort to move all
% random crisprs to the end (crisprid assigned to rand crisprs)
in_table = sortrows(in_table,'crisprid','ascend');
randvec = 14153; % first random crispr. 4 in total.
[C,ia,~]= unique(in_table.crisprid);
[~,locb]=ismember(randvec,C);

rand_crispridx = ia(locb(1));
fitness_denom_temp = in_table.normcountt2./in_table.normcountt1;
% take mean of t2/t1 calculated for all barcodes of random crisprs
denom_out = mean(fitness_denom_temp(rand_crispridx:end));


end