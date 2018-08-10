% load OECD SNA data and compare with UNSNA data

concordance_OECDSNA_macroDB = xlsread(ConcordanceXLScountries,'stats.OECD_SNA','B2:AV215');
concordance_OECDSNA_macroDB(isnan(concordance_OECDSNA_macroDB)) = 0;
nreg = size(concordance_OECDSNA_macroDB,2);
regs = [1:35,39:47];


if ~exist('UNSNAusd')
    load([thispath,'Data\SNAstructure\UNSNAusd.mat']);
end

OECDSNAusd = UNSNAusd;
ny = 2015-1994;
for t = 1995:2015
    yearnames{t-1994} = num2str(t);
end
OECDSNAusd.val = zeros(nreg,size(OECDSNAusd.val,2),ny);

OECDSNAusd.val(:,15,:) = xlsread([thispath,'Data\20180620OECDsna.xlsx'],'J53:AD99'); %tva
OECDSNAusd.val(:,2,:) = xlsread([thispath,'Data\20180620OECDsna.xlsx'],'J361:AD407');%hhnp
OECDSNAusd.val(:,3,:) = xlsread([thispath,'Data\20180620OECDsna.xlsx'],'J496:AD542');%gov
OECDSNAusd.val(:,4,:) = xlsread([thispath,'Data\20180620OECDsna.xlsx'],'J543:AD589');%gcf
OECDSNAusd.val(:,5,:) = xlsread([thispath,'Data\20180620OECDsna.xlsx'],'J680:AD726');%ex
OECDSNAusd.val(:,6,:) = xlsread([thispath,'Data\20180620OECDsna.xlsx'],'J813:AD859');%im

OECDSNAusd.val(:,1,:) = OECDSNAusd.val(:,2,:) + OECDSNAusd.val(:,3,:) + OECDSNAusd.val(:,4,:);
OECDSNAusd.val(:,7,:) = OECDSNAusd.val(:,1,:) + OECDSNAusd.val(:,5,:) - OECDSNAusd.val(:,6,:);
OECDSNAusd.val(isnan(OECDSNAusd.val)) = 0;

UNSNAusdOECDSNA = OECDSNAusd.val; UNSNAusdOECDSNA(:,:,:) = 0;


comp = [2,3,4,5,6,7,15];
compnames = {'HHN','GOV','GCF','EXP','IMP','GDP','TVA'};

figure()
c = 1;
for i = comp
    %UNSNAusdOECDSNA(:,i,:) = concordance_OECDSNA_macroDB' * squeeze(UNSNAusd.val(:,i,:));
    UNSNAusdOECDSNAi = concordance_OECDSNA_macroDB' * squeeze(UNSNAusd.val(:,i,:));
    ratio = 1E6*squeeze(OECDSNAusd.val(:,i,:)) ./ UNSNAusdOECDSNAi;
    subplot(1,7,c)
    boxplot(ratio(regs,:))
    ylim([0,2]);
    title([compnames(c),' OECD/UN'])
    ax = gca;
    set(gca, 'XTick', [1:5:ny])
    set(gca, 'XTickLabel', [1995:5:2015])
    c=c+1;
end