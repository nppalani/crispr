function out_tab = calcsdofsd(in_tab)
tic

[a,b]=size(in_tab);
%out_tab=zeros(a,b);

parfor i = 1:a
        for j=1:b
            out_tab(i,j)=std(in_tab(i,1:j));
            

        end
end

toc
end
