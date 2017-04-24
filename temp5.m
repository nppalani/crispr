% t1 = twodtn_mc(1E1);
 t2 = twodtn_mc(1E2);
% t3 = twodtn_mc(1E3);
 t4 = twodtn_mc(1E4);
% t5 = twodtn_mc(1E5);
 t6 = twodtn_mc(1E6);

% plot(t1.SD_mccalc,'m');

plot(t2.readcount,t2.SD_mccalc,'r');hold on
% plot(t3.SD_mccalc,'g');
plot(t4.readcount,t4.SD_mccalc,'g');
% plot(t5.SD_mccalc,'y');
plot(t6.readcount,t6.SD_mccalc,'b');