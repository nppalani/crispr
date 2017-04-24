function fitvspvalplot(in_tablefit,in_tablepval)
% plot fitness vs p value failures

crispfit = calcgenefitness(in_tablefit);

libsize=height(crispfit);

    for i=1:libsize
    
        
        
    
    end



%for each crispr, pull pvalues at a certain significance
%pval=nonzeros(CIreppval(i,1:end));
% xx = pval(pval<0.1) 
%plotting multiple signifances (range)
% xx= setdiff(pval(pval<0.1),pval(pval<0.01))

%plot fitness on one y axis yyaxis left
% plot length(xx) as yyaxis right (number of p val failures per gene)

% plot fitness on x axis, p val failure values on y axis (scatter plot)
% shows spread

%plot fitness on x axis, number of p val failure values on y axis

end