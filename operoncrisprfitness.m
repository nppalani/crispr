
function outstruct = operoncrisprfitness(in_struct, crisprrefdb)
%map gene operon information onto fitness data. Input structure contains
%atleast crisprid and fitness
in_tab = struct2table(in_struct);
in_ref = struct2table(crisprrefdb);

[~,locb] = ismember(in_tab.crisprid,in_ref.crisprid);
clear in_tab in_ref;

    for i=1:length(locb)
        if locb(i) ~= 0
            in_struct(i).operonindex = crisprrefdb(locb(i)).operonindex;
             in_struct(i).genepos = crisprrefdb(locb(i)).genepos;
         else
           in_struct(i).operonindex =0;
           in_struct(i).genepos =0;
         end
    end
    outstruct = in_struct;
    
end
