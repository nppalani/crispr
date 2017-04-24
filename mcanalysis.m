load('crispr_recalc_newfitness.mat');

ccmr1mc = bcmcarlo_newfit(ccmr1);
ccmr2mc = bcmcarlo_newfit(ccmr2);
cimr1mc = bcmcarlo_newfit(cimr1);
cimr2mc = bcmcarlo_newfit(cimr2);
cimcr1mc = bcmcarlo_newfit(cimcr1);
cimcr2mc = bcmcarlo_newfit(cimcr2);
cumr1mc = bcmcarlo_newfit(cumr1);

save('crispr_newfit_MCanal.mat','ccmr1mc','ccmr2mc','cimr1mc','cimr2mc','cimcr1mc','cimcr2mc','cumr1mc','-v7.3');

