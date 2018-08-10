%% EXIOBASE UNSNA comparison
run('Initialize_EXIO.m');

%% EXIOBASE calc

EXIOvalues = zeros(nreg,ncategories+1,ntotyears);
UNSNAeurEXIO = EXIOvalues;

years = 1995:2016;
%years = [1995,2000,2007,2011]
%years = 2011;

figure()
fc = 1;
for year = years
    t = year - 1994;
    load([EXIOpath,'IOT_',num2str(year),'_ixi.mat']);
    %tic
    IO.Z = IO.A .* repmat(IO.x',size(IO.A,1),1);
    %toc 
    [EXIOvalues(:,:,t)] = calcSNAvalues(IO,nreg,nind,nfd,HHNP,GOV,GCF,concordance_EXIOBASE_UN7);
    UNSNAeurEXIO(:,:,t) = concordance_EXIOBASE_macroDB' * UNSNAeur.val(:,:,t);
    ratio = 1E6*EXIOvalues(:,:,t)./ UNSNAeurEXIO(:,:,t);
    
    subplot(1,length(years),fc);fc=fc+1;
    boxplot(ratio);
    title(['EXIOBASE ',num2str(year)]);
    
%     UNSNAeurEXIO2(:,:,t) = concordance_EXIOBASE_macroDB' * UNSNAeur2.val(:,:,t);
%     ratio = 1E6*EXIOvalues(:,:,t)./ UNSNAeurEXIO2(:,:,t);
%     figure()
%     boxplot(ratio);
%     title(['EXIOBASE sna ',num2str(year)]);
end % for year
  

%% save data
save([datapath,'\SNAstructure\UNSNAeurEXIO2.mat'],'UNSNAeurEXIO2');
save([datapath,'\SNAstructure\UNSNAeurEXIO.mat'],'UNSNAeurEXIO');
EXIOvalues = 1E6*EXIOvalues;
save([datapath,'\SNAstructure\EXIOvalues.mat'],'EXIOvalues');
 
