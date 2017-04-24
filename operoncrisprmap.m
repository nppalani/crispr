
function outstruct = operoncrisprmap(in_struct, crisprrefdb)
% map unique crisprids to a structure that contains operon information
% Unique operon ID, gene position & genename
in_tab = struct2table(in_struct);
in_ref = struct2table(crisprrefdb);

[~,locb] = ismember(in_tab.genename,in_ref.genename);
clear in_tab in_ref;

    for i=1:length(locb)
        if locb(i) ~= 0
            %in_struct(i).genename = crisprrefdb(locb(i)).genename;
            in_struct(i).crisprid = crisprrefdb(locb(i)).crisprid;
                    
        else
            %in_struct(i).genename = 'NA';
            in_struct(i).crisprid = 0;
        end
    end
    outstruct = in_struct;
    
end
