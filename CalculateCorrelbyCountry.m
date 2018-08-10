function CORbyCOU = CalculateCorrelbyCountry(values,SNA)
    selsna = [2:6,8:14];
    nreg = size(values,1);
    CORbyCOU = zeros(nreg,1);
    for c = 1:nreg
        vm = squeeze(values(c,selsna,:));
        sm = squeeze(SNA(c,selsna,:));
        v = vm(:);
        s = sm(:);
        CORbyCOU(c) = corr(v,s,'Type','pearson') ;
    end
    

end