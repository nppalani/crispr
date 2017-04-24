function fit=igorfitness(in_table)
tic
% enter counts and total counts for both time points (vectors)
% enter sims for number of simulations
randmean_denom = randommean_denom(in_table);

c0 = [in_table.countt1];
c1 = [in_table.countt2];
sims = 100000;
expfac=4;
t0= sum(c0(:,1));
t1= sum(c1(:,1));
wt = log(randmean_denom*expfac);
% set dimensions of result structure 
fit(length(c0)).mean=[];

% calculate p for all entries
p(1,:)=c0./t0;
p(2,:)=c1./t1;

% calculate sds for all entries
sd(1,:)=sqrt(t0.*p(1,:).*(1-p(1,:)));
sd(2,:)=sqrt(t1.*p(2,:).*(1-p(2,:)));


% perform monte carlo runs on one set of read count at a time
parfor i=1:length(c0)
    % draw read counts 
    draw0=normrnd(c0(i),sd(1,i),sims,1);
    draw1=normrnd(c1(i),sd(2,i),sims,1);
    % calculate fitness vector
    normt0 = draw0./t0; normt1 = draw1./t1; 
    fitruns=log(normt1./normt0.*expfac)./log(wt*expfac);
    % calculate mean and sd for fitness
    fit(i).mean=mean(fitruns);
    fit(i).sd=std(fitruns);
end
toc
end


