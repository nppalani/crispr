load('crispr_newfit_MCanal.mat');

ccmr1pval = bc_pvalcalc(ccmr1mc);
ccmr2pval = bc_pvalcalc(ccmr2mc);

cimr1pval = bc_pvalcalc(cimr1mc);
cimr2pval = bc_pvalcalc(cimr2mc);

cimcr1pval = bc_pvalcalc(cimcr1mc);
cimcr2pval = bc_pvalcalc(cimcr2mc);

cumr1pval = bc_pvalcalc(cumr1mc);

save('crispr_pval_calc.mat','ccmr1pval','ccmr2pval','cimr1pval','cimr2pval','cimcr1pval','cimcr2pval','cumr1pval','-v7.3');