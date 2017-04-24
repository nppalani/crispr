
function [fitoutmean, fitoutstd] = bcmcarloss_gene(in_struct,trialspten,stepsize)

tic

% Declarations

expfac = 4;

countt1 = [in_struct.countt1].';
countt2 = [in_struct.countt2].';
crisprid = [in_struct.crisprid].';


[uniqcrispr, ia,~]=unique(crisprid);
repli_count = countmember(uniqcrispr,crisprid);

libsize= length(uniqcrispr);
trials = 10^trialspten;

sizedef = trials/stepsize;
trialnum=zeros(1,sizedef);
for z = 1:sizedef
    trialnum(1,z) = z*stepsize;
end


fitoutmean = zeros(libsize,sizedef);
fitoutstd = zeros(libsize,sizedef);

% total reads per timepoint
totalReadst1= sum(countt1(:,1));
totalReadst2= sum(countt2(:,1));


    parfor i=1:libsize

        bound1 = ia(i); bound2= ia(i)+(repli_count(i)-1);

        tempcountt1 = countt1(bound1:bound2);
        tempcountt2 = countt2(bound1:bound2);
           
                  
           mean1 = mean(tempcountt1);
           mean2 = mean(tempcountt2); 
          
           prob1 = mean1/totalReadst1;   prob2 = mean2/totalReadst2;

            sig1 = sqrt(totalReadst1*prob1*(1-prob1));
            sig2 = sqrt(totalReadst2*prob2*(1-prob2));

            rndt1 = normrnd(mean1,sig1,[trials 1]);
            rndt2 = normrnd(mean2,sig2,[trials 1]);

            normt1 = rndt1./totalReadst1; normt2 = rndt2./totalReadst2;

            %fitness equation
            fitness = (log(normt2.*(expfac./normt1)))./(log((1-normt2).*(expfac./(1-normt1))));


                 mc_mean = zeros(sizedef,1);
                 mc_std = zeros(sizedef,1);
                
                k=1;
                for j=trialnum

                    mc_mean(k,1) = mean(fitness(1:j,1)); 
                    mc_std(k,1) = std(fitness(1:j,1));
                    k=k+1;
                end
                        
            fitoutmean(i,:)=mc_mean.';
            fitoutstd(i,:)=mc_std.';
            

    
    
    end
    toc
end

