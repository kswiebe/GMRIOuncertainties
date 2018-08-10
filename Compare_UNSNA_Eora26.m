%% Eora26 UNSNA comparison
run('Initialize_Eora26.m');


%% Eora26 calc


EORA26values = zeros(nreg,ncategories+1,ntotyears);
UNSNAusdEORA26 = EORA26values;

years = 1995:2015;
%years = [1995,2000,2005,2011]
%years = 2011;
%year = 2011;


figure()
fc = 1;
for year = years
    t = year - 1994;
    load([EORA26path,'mrio_',num2str(year),'_ZVYF.mat']);
    % get rid of ROW statistical dscrepancies
    IO.Y = IO.Y(1:nri,:);
    IO.Z = IO.Z(1:nri,1:nri);
    IO.V = IO.V(:,1:nri);
    IO.x = IO.x(1:nri,:);
        
    [EORA26values(:,:,t)] = calcSNAvalues(IO,nreg,nind,nfd,HHNP,GOV,GCF,concordance_EORA26_UN7);
    UNSNAusdEORA26(:,:,t) = concordance_EORA26_macroDB' * UNSNAusd.val(:,:,t);
    
    ratio = 1E3*EORA26values(:,:,t)./ UNSNAusdEORA26(:,:,t);
    
    
    subplot(1,length(years),fc);fc=fc+1;
    boxplot(ratio);
    title(['EORA26 excl. Chad, Guyana ',num2str(year)]);
end % for year
   
%% save
save([datapath,'\SNAstructure\UNSNAusdEORA26.mat'],'UNSNAusdEORA26');
EORA26values = 1E3*EORA26values;
save([datapath,'\SNAstructure\EORA26values.mat'],'EORA26values');