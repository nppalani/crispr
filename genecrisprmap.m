
function outstruct = genecrisprmap(in_struct, crisprrefdb)

in_tab = struct2table(in_struct);
in_ref = struct2table(crisprrefdb);

[~,locb] = ismember(in_tab.crispr,in_ref.crisprseq);
clear in_tab in_ref;

    for i=1:length(locb)
        if locb(i) ~= 0
            in_struct(i).genename = crisprrefdb(locb(i)).genename;
            in_struct(i).crisprid = crisprrefdb(locb(i)).crisprid;
            in_struct(i).generef = crisprrefdb(locb(i)).generef;
            
        else
            in_struct(i).genename = 'NA';
            in_struct(i).crisprid = 0;
            in_struct(i).generef = 'NA';
         end
    end
    outstruct = in_struct;
    
end
