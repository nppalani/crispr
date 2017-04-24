function [meanout,stdout]=temptemp(in_table,normdenom)
tic
countt1 = [in_table.countt1];
countt2 = [in_table.countt2];
trials = 100000;

totalReadst1= sum(countt1(:,1));
totalReadst2= sum(countt2(:,1));

expfac=4;

[libsize,~]=size(countt1);
meanout=zeros(libsize,1);
meanstd=zeros(libsize,1);

randcrisp_normfit = log(normdenom*expfac);

        for i=1:libsize
            mean1 = countt1(i,1);  mean2 = countt2(i,1);

            prob1 = mean1/totalReadst1;   prob2 = mean2/totalReadst2;

            sig1 = sqrt(totalReadst1*prob1*(1-prob1));
            sig2 = sqrt(totalReadst2*prob2*(1-prob2));

            rndt1 = normrnd(mean1,sig1,[trials 1]);
            rndt2 = normrnd(mean2,sig2,[trials 1]);

            normt1 = rndt1./totalReadst1; normt2 = rndt2./totalReadst2;

            fitness = (log((normt2./normt1).*expfac))./randcrisp_normfit;      
            
            meanout(i,1) = mean(fitness(1:xy,1)); 
            stdout(i,1) = std(fitness(1:xy,1));
                   
         
                        
           

        end 
toc
end
