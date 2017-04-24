
function [fitoutmean, fitoutstd] = bcmcarlo(in_struct,trials)
 
tic

% Declarations
expfac = 4;
libsize= 100; % length(in_struct);
countt1 = [in_struct.countt1].';
countt2 = [in_struct.countt2].';
% crisprid = [in_struct.crisprid].';


fitoutmean = zeros(libsize,trials);
fitoutstd = zeros(libsize,trials);


% total reads per timepoint
totalReadst1= sum(countt1(:,1));
totalReadst2= sum(countt2(:,1));


        parfor i=1:libsize

            mean1 = countt1(i,1);  mean2 = countt2(i,1);

            prob1 = mean1/totalReadst1;   prob2 = mean2/totalReadst2;

            sig1 = sqrt(totalReadst1*prob1*(1-prob1));
            sig2 = sqrt(totalReadst2*prob2*(1-prob2));

            rndt1 = normrnd(mean1,sig1,[trials 1]);
            rndt2 = normrnd(mean2,sig2,[trials 1]);

            normt1 = rndt1./totalReadst1; normt2 = rndt2./totalReadst2;

            fitness = (log(normt2.*(expfac./normt1)))./(log((1-normt2).*(expfac./(1-normt1))));
                
            
                mc_mean = zeros(trials,1);
                mc_std = zeros(trials,1);
                for j=1:trials

                    mc_mean(j,1) = mean(fitness(1:j,1)); 
                    mc_std(j,1) = std(fitness(1:j,1));

                end
                        
           fitoutmean(i,:)=mc_mean.';
            fitoutstd(i,:)=mc_std.';

        
        
        end
        

toc
end
