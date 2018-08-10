%% simple correlation analysis

CORbyCOU_ICIO = CalculateCorrelbyCountry(ICIOvalues,UNSNAusdICIO);
CORbyCOU_ICIOgr = CalculateCorrelbyCountry(ICIOvalues_gr(:,:,2:end),UNSNAusdICIO_gr(:,:,2:end));

CORbyCOU_EORA26 = CalculateCorrelbyCountry(EORA26values,UNSNAusdEORA26);
CORbyCOU_EORA26gr = CalculateCorrelbyCountry(EORA26values_gr(:,:,2:end),UNSNAusdEORA26_gr(:,:,2:end));

CORbyCOU_WIOD = CalculateCorrelbyCountry(WIODvalues(:,:,1:17),UNSNAusdWIOD);
CORbyCOU_WIODgr = CalculateCorrelbyCountry(WIODvalues_gr(:,:,2:17),UNSNAusdWIOD_gr(:,:,2:end));

CORbyCOU_EXIO = CalculateCorrelbyCountry(EXIOvalues,UNSNAeurEXIO);
CORbyCOU_EXIOgr = CalculateCorrelbyCountry(EXIOvalues_gr(:,:,2:end),UNSNAeurEXIO_gr(:,:,2:end));

figure()
subplot(2,4,1)
boxplot(CORbyCOU_EORA26)
ylim([0,1])
title('Eora26 v199.82')
subplot(2,4,2)
boxplot(CORbyCOU_EXIO)
ylim([0,1])
title('EXIOBASE v3.6')
subplot(2,4,3)
boxplot(CORbyCOU_ICIO)
title('ICIO2015')
ylim([0,1])
subplot(2,4,4)
boxplot(CORbyCOU_WIOD)
title('WIOD v2013.413')
ylim([0,1])
subplot(2,4,5)
boxplot(CORbyCOU_EORA26gr)
title('Eora26 growth')
ylim([0,1])
subplot(2,4,6)
boxplot(CORbyCOU_EXIOgr)
title('EXIOBASE growth')
ylim([0,1])
subplot(2,4,7)
boxplot(CORbyCOU_ICIOgr)
title('ICIO growth')
ylim([0,1])
subplot(2,4,8)
boxplot(CORbyCOU_WIOD)
ylim([0,1])
title('WIOD growth')