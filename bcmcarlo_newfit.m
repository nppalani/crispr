function out_table =bcmcarlo_newfit(in_table)
tic

% calculate denominator of fitness eqn from random crisprs.
randmean_denom = randommean_denom(in_table);
countt1 = [in_table.countt1];
countt2 = [in_table.countt2];
trials = 100000; % number of trials

totalReadst1= sum(countt1(:,1));
totalReadst2= sum(countt2(:,1));

expfac=4;

[libsize,~]=size(countt1);
meanout=zeros(libsize,1);
stdout=zeros(libsize,1);

randcrisp_normfit = log(randmean_denom*expfac);

        parfor i=1:libsize
            mean1 = countt1(i,1);  mean2 = countt2(i,1);

            prob1 = mean1/totalReadst1;   prob2 = mean2/totalReadst2;

            sig1 = sqrt(totalReadst1*prob1*(1-prob1));
            sig2 = sqrt(totalReadst2*prob2*(1-prob2));

            rndt1 = normrnd(mean1,sig1,[trials 1]);
            rndt2 = normrnd(mean2,sig2,[trials 1]);

            normt1 = rndt1./totalReadst1; normt2 = rndt2./totalReadst2;

            fitness = (log((normt2./normt1).*expfac))./randcrisp_normfit;      
            
            meanout(i,1) = mean(fitness(1:end,1)); 
            stdout(i,1) = std(fitness(1:end,1));
                   
        end 
        in_table.fit_mccalc = meanout;
        in_table.SD_mccalc = stdout;
        
        out_table = in_table;
toc
end
