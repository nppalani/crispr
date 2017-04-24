function out_table = twodtn_mc(trials, numcols)

%Monte Carlo estimate of Std.dev for 2D TnSeq to determine error associated
%with number of reads per mutant per timepoint.
tic
count = (100:50:1000).'; %reads from 100 to 1000
Allreads = count.*(numcols); %total reads for number of colonies/mutants

expfac = 5; % samples measured at OD600 0.2 and 1.0
[libsize,~]=size(count);
meanout=zeros(libsize,1);
stdout=zeros(libsize,1);

 parfor i=1:libsize
            meanval = count(i,1);
            totalReads = Allreads(i,1);
           
            probval = meanval/totalReads;

            sigval = sqrt(totalReads*probval*(1-probval));
          
            rndt1 = normrnd(meanval,sigval,[trials 1]);
            rndt2 = normrnd(meanval,sigval,[trials 1]);

            normt1 = rndt1./totalReads; normt2 = rndt2./totalReads;

            fitness = (log(normt2.*(expfac./normt1)))./(log((1-normt2).*(expfac./(1-normt1))));
            
            meanout(i,1) = mean(fitness(1:end,1)); 
            stdout(i,1) = std(fitness(1:end,1));
                   
 end
        out_table.readcount = count;
        out_table.fit_mccalc = meanout;
        out_table.SD_mccalc = stdout;
        
        out_table = struct2table(out_table);

toc
end
