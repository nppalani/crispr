function [num_trupos, num_falspos]=psig(in_table)
% calculate significance at different levels

alpha = [0.0001 0.001 0.01 0.1];
pvals = nonzeros(in_table);
k=1;
for i=alpha
num_trupos(1,k) = length(pvals(pvals>i));
num_falspos(1,k) = length(pvals(pvals<=i));
k=k+1;
end
end
