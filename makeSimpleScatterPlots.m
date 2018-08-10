% make correlation graphs

% plotSimpleScatter(temp1,temp2,titlename,xlimit,ylimit)

figure()
%% EORA 
subplot(2,4,1)
plotSimpleScatter(EORA26values(:,selsna,:),UNSNAusdEORA26(:,selsna,:),'Eora26 - USD')
subplot(2,4,5)
plotSimpleScatter(EORA26values_gr(:,selsna,2:end),UNSNAusdEORA26_gr(:,selsna,2:end),'Eora26 - Growth Rates')

%% EXIOBASE 
subplot(2,4,2)
plotSimpleScatter(EXIOvalues(:,selsna,:),UNSNAeurEXIO(:,selsna,:),'EXIOBASE - USD')
subplot(2,4,6)
plotSimpleScatter(EXIOvalues_gr(:,selsna,2:end),UNSNAeurEXIO_gr(:,selsna,2:end),'EXIOBASE - Growth Rates')

%% ICIO 
subplot(2,4,3)
plotSimpleScatter(ICIOvalues(:,selsna,:),UNSNAusdICIO(:,selsna,:),'ICIO2015 - USD')
subplot(2,4,7)
plotSimpleScatter(ICIOvalues_gr(:,selsna,2:end),UNSNAusdICIO_gr(:,selsna,2:end),'ICIO2015 - Growth Rates')

%% WIOD 
subplot(2,4,4)
plotSimpleScatter(WIODvalues(:,selsna,1:17),UNSNAusdWIOD(:,selsna,:),'WIOD - USD')
subplot(2,4,8)
plotSimpleScatter(WIODvalues_gr(:,selsna,2:17),UNSNAusdWIOD_gr(:,selsna,2:end),'WIOD - Growth Rates')

