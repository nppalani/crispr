function fit=igorfitness_a(in_table)
% enter counts and total counts for both time points (vectors)
randmean_denom = randommean_denom(in_table);

c0 = [in_table.countt1];
c1 = [in_table.countt2];
expfac=4;
t0= sum(c0(:,1));
t1= sum(c1(:,1));
wt = log(randmean_denom*expfac);
% calculate p for all entries
p(1,:)=c0./t0;
p(2,:)=c1./t1;

% calculate sds for all entries
sd(1,:)=sqrt(t0.*p(1,:).*(1-p(1,:)));
sd(2,:)=sqrt(t1.*p(2,:).*(1-p(2,:)));

% calculate partial derivatives
dwdf(1,:)=1./(c0.*log(d.*wt));
dwdf(2,:)=1./(c1.*log(d.*wt));

%normalized counts
 normt0 = c0./t0; normt1 = c1./t1;

% calculate fitness
fit.w=log(normt1./normt0.*expfac)./log(wt*expfac);
% calculate standard deviation
fit.sd=sqrt((dwdf(1,:).*sd(1,:)).^2+(dwdf(2,:).*sd(2,:)).^2);



