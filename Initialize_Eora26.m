%% Initialize Eora26

%% concordance to macro_DB
concordance_EORA26_macroDB = xlsread(ConcordanceXLScountries,'EORA26','B2:GH215');
concordance_EORA26_macroDB(isnan(concordance_EORA26_macroDB)) = 0;

%% concordance to UN7
concordance_EORA26_UN7 = xlsread(ConcordanceXLSsectors,'EORA26','B2:AA8');
concordance_EORA26_UN7(isnan(concordance_EORA26_UN7)) = 0;
 nreg = 189; %one RoW as Statistical Discrepencies
 nind = 26;
 nri = nreg*nind;
 nva = 6;
 nfd = 6; 
%{'Household final consumption P.3h';
%'Non-profit institutions serving households P.3n';
HHNP = 1:2;
%'Government final consumption P.3g';
GOV = 3;
%'Gross fixed capital formation P.51';
%'Changes in inventories P.52';
%'Acquisitions less disposals of valuables P.53'}
GCF = 4:6;

%% path to IO table
EORA26path = '\\winfil.it.ntnu.no\EPT_eksperimentell\indecol\Projects\MRIOs\Eora26\v199.82\';
%Eora = load([EORA26path,'mrio_2011_ZVYF.mat']);
% load([EORA26path,'mrio_',num2str(year),'_ZVYF.mat']);
%     % get rid of ROW statistical dscrepancies
%     IO.Y = IO.Y(1:nri,:);
%     IO.Z = IO.Z(1:nri,1:nri);
%     IO.V = IO.V(:,1:nri);
%     IO.x = IO.x(1:nri,:);
