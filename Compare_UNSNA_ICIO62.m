%% OECD ICIO62 UNSNA comparison
run('Initialize_ICIO62.m');

%% OECD ICIO calc




ICIOvalues = zeros(nreg,ncategories+1,ntotyears);
UNSNAusdICIO = ICIOvalues;

years = 1995:2011;
%years = [1995,2000,2005,2011]
%years = 2011;
%year = 2011;


figure()
fc = 1;
for year = years
    t = year - 1994;
    load([OECDICIOpath,'OECD_62_',num2str(year),'_ZF.mat']);
    IO.V = IO.V';
    
    [ICIOvalues(:,:,t)] = calcSNAvalues(IO,nreg,nind,nfd,HHNP,GOV,GCF,concordance_ICIO_UN7);
    UNSNAusdICIO(:,:,t) = concordance_ICIO_macroDB' * UNSNAusd.val(:,:,t);
    
    ratio = 1E6*ICIOvalues(:,:,t)./ UNSNAusdICIO(:,:,t);
    
    
    subplot(1,length(years),fc);fc=fc+1;
    boxplot(ratio);
    title(['ICIO62 ',num2str(year)]);
    
    
end % for year
   
%% save
save([datapath,'\SNAstructure\UNSNAusdICIO.mat'],'UNSNAusdICIO');
ICIOvalues = 1E6*ICIOvalues;
save([datapath,'\SNAstructure\ICIOvalues.mat'],'ICIOvalues');



