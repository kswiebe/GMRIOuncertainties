%% WIOD UNSNA comparison
run('Initialize_WIOD.m');


%% WIOD calc

WIODvalues = zeros(nreg,ncategories+1,ntotyears);
UNSNAeurWIOD = WIODvalues;

years = 1995:2011;
%years = [1995,2000,2005,2011]
%years = 2011;
% year = 2011;

figure()
fc = 1;
for year = years
    t = year - 1994;
    load([WIODpath,'WIOD_ixi_',num2str(year),'_ZVYF.mat']);
    
    [WIODvalues(:,:,t)] = calcSNAvalues(IO,nreg,nind,nfd,HHNP,GOV,GCF,concordance_WIOD_UN7);
    UNSNAusdWIOD(:,:,t) = concordance_WIOD_macroDB' * UNSNAusd.val(:,:,t);
    
    ratio = 1E6*WIODvalues(:,:,t)./ UNSNAusdWIOD(:,:,t);
    
    subplot(1,length(years),fc);fc=fc+1;
    boxplot(ratio(1:(end-1),:));
    %ylim([0 2]);
    title(['WIOD ',num2str(year)]);
end % for year
  
%% save data
save([datapath,'\SNAstructure\UNSNAusdWIOD.mat'],'UNSNAusdWIOD');
WIODvalues = 1E6*WIODvalues;
save([datapath,'\SNAstructure\WIODvalues.mat'],'WIODvalues');