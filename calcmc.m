
function [fitout,inmean,instd] = calcmc(in_struct,trials)
tic
in_length=length(in_struct);
in_tab=struct2table(in_struct);

inmean = mean(in_tab.fitness); instd = std(in_tab.fitness);
meancountt1 = mean(in_tab.countt1); stdcount1 = std(in_tab.countt1);
meancountt2 = mean(in_tab.countt2); stdcount2 = std(in_tab.countt2);


expfac=4;
mcout(trials)=struct();
    for j=1:trials

            rndrawcountt1 = normrnd(meancountt1,stdcount1,[in_length 1]);
            rndrawcountt2 = normrnd(meancountt2,stdcount2,[in_length 1]);


            rndcountt1  = rndrawcountt1(:,1)/sum(rndrawcountt1(:,1));
            rndcountt2  = rndrawcountt2(:,1)/sum(rndrawcountt2(:,1));

            parfor i = 1:in_length
                    fitness(i,1) = (log(rndcountt2(i,1) * (expfac/rndcountt1(i,1))))/(log((1-rndcountt2(i,1))*(expfac/(1-rndcountt1(i,1)))));
            end

                mcout(j).fitness = mean(fitness(:,1)); mcout(j).std = std(fitness(:,1));

    end

    fitout=mcout;
  
    toc
  
 end