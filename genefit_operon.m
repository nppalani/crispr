function out_table = genefit_operon(in_struct)

tic

% Declarations

crisprid = [in_struct.crisprid].';
fitness = [in_struct.fitness].';
operonid = [in_struct.operonindex].';
genepos = [in_struct.genepos].';



[uniqcrispr, ia,~]=unique(crisprid);
repli_count = countmember(uniqcrispr,crisprid);

libsize= length(uniqcrispr);

out_struct=struct();

  for i=1:libsize

        bound1 = ia(i); bound2= ia(i)+(repli_count(i)-1);

      mean_genefitness = mean(fitness(bound1:bound2));
      
      out_struct(i).crisprid = uniqcrispr(i,1);
      out_struct(i).operonid = operonid(bound1,1);
      out_struct(i).genepos = genepos(bound1,1);
      out_struct(i).fitness = mean_genefitness;
      
      
  end
  
  out_table = struct2table(out_struct);
end
