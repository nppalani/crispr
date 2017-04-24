function opgenesout = operonfunc(in_struct,operonrefdb)
% Calls functions to produce a table that contains only those genes that
% have greater than 1 gene represented from their operon. Input is operon
% reference map and crispr fitness structure.


%Maps operon information on to input structure
mapFit_operon = operoncrisprfitness(in_struct, operonrefdb);

%Pulls out genes for which operon information is present
keepOperonFit = genefit_operon(mapFit_operon);


% Keeps only those genes that have >1 genes in their operon & with fitness value  
opgenesout = operongene_fitness(keepOperonFit);


end
