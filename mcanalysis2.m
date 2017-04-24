load('crispr_tnseqfitnessformula.mat');

ccmr1mcold = bcmcarlo_oldfit(ccmr1oldfit);
ccmr2mcold = bcmcarlo_oldfit(ccmr2oldfit);
cimr1mcold = bcmcarlo_oldfit(cimr1oldfit);
cimr2mcold = bcmcarlo_oldfit(cimr2oldfit);
cimcr1mcold = bcmcarlo_oldfit(cimcr1oldfit);
cimcr2mcold = bcmcarlo_oldfit(cimcr2oldfit);
cumr1mcold = bcmcarlo_oldfit(cumr1oldfit);

save('crispr_oldfit_MCanal.mat','ccmr1mcold','ccmr2mcold','cimr1mcold','cimr2mcold','cimcr1mcold','cimcr2mcold','cumr1mcold','-v7.3');

