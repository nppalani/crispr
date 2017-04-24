function [pval] = ztestcalc(mean1,mean2,sd1,sd2)

ztest = abs((mean1-mean2)/sqrt((sd1^2)+(sd2^2)));

ptest = normcdf([-ztest ztest]);

pval = 1-((ptest(2)-ptest(1)));


end
