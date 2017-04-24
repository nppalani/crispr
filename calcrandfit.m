  
function [expfacCalc] = calcrandfit(in_table)

%expfac =4;
f = 0.99; %[in_table.fitness];
normt1 = [in_table.countt1];
normt2 = [in_table.countt2];
normt11 =[in_table.normcountt1];
normt12 =[in_table.normcountt2];
%cons = -1i*f*pi;
expfacCalc = exp((log(normt12./normt11)+(f.*log((1-normt11)./(1-normt12))))./(f-1));

%fitnessnorm = (log(normt12.*(expfac./normt11)))./(log((1-normt12).*(expfac./(1-normt11))));
%fitnesscount = (log(normt2.*(expfac./normt1)))./(log((1-normt2).*(expfac./(1-normt1))));

%expfac2= exp(((-1i.*f.*pi) + (f.*log(1-normt1))-log(normt1)-(f.*log(-1+normt2))+log(normt2))./(-1+f));

end
