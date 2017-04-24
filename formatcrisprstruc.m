function [out_table]=formatcrisprstruc(in_struct)
%formats the structure in crispr_fitness.mat into a table for use with
%revisefitness.m

in_struct = rmfield(in_struct, {'generef','barcode','crispr'});

out_table = struct2table(in_struct);

clear in_struct;
end
