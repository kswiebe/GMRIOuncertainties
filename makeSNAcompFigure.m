function makeSNAcompFigure(OTHERdata,UNSNAdata,SNAnames,OTHERname,ylimit)

ny = min(size(OTHERdata,3),size(UNSNAdata,3));
comp = [2:7,15,8:14];
compnames = SNAnames(comp);

figure()
c = 1;
for i = comp
    ratio = squeeze(OTHERdata(:,i,1:ny)) ./ squeeze(UNSNAdata(:,i,1:ny));
    subplot(2,7,c)
    boxplot(ratio)
    ylim(ylimit);
    title([compnames(c),' ',OTHERname,'/UNSNA'])
    set(gca, 'XTick', 1:5:21)
    set(gca, 'XTickLabel', 1995:5:2015)
    c=c+1;
end