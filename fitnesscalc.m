function outstr = fitnesscalc(instr)

    for i = 1:length(instr)

        expfac=4;
        numer = log(instr(i).normcountt2 * (expfac/instr(i).normcountt1));
        denom = log((1-instr(i).normcountt2)*(expfac/(1-instr(i).normcountt1)));

        instr(i).fitness = numer/denom;

    end
    outstr = instr;
end
