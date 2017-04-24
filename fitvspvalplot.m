function [out_table]=fitvspvalplot(in_tablefit,in_tablepval,sigval)
% plot fitness vs p value failures

crispfit = calcgenefitness(in_tablefit);
numbarc = [crispfit.numbarcodes];
libsize=height(crispfit);


    for i=1:libsize
        pval = nonzeros(in_tablepval(i,1:end));
        tempvar = (pval(pval<sigval));
        pfails_num=length(tempvar);
        
        crispfit.pval(i,1)=pfails_num;
        
        % plot fitness on x axis, p val failure values on y axis (scatter plot)
        % shows spread
        
        if pfails_num >0
        
        crispfit.pvalmax(i,1)= max(tempvar);
        crispfit.pvalmin(i,1)= min(tempvar);
        
        else
            
        crispfit.pvalmax(i,1)= NaN;
        crispfit.pvalmin(i,1)= NaN;
        end
        %plotting multiple signifances (range)
       % crispfit.pval2(i,1)=length(setdiff(pval(pval<sigval),pval(pval<(sigval/10))));
    end
total_pvals = (numbarc.*(numbarc-1))./2;
crispfit.pvalcountnorm = crispfit.pval./total_pvals;
%crispfit.pvalcountnorm2 = crispfit.pval2./total_pvals;
out_table = crispfit;




%plot fitness on x axis, number of p val failure values on y axis

end