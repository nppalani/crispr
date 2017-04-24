% ccr1 = fitvspvalplot(ccmr1mc,ccmr1pval,0.01);
  ccr2 = fitvspvalplot(cimr2mc,cimr2pval,0.01);
% 
% ccr1 = sortrows(ccr1,'fitness','ascend');
%  ccr2 = sortrows(ccr2,'fitness','ascend');
% sarea = 20;
% scatter(ccr1.fitness,ccr1.pvalcountnorm,sarea,'filled');
% hold on;
% scatter(ccr2.fitness,ccr2.pvalcountnorm,sarea,'filled');