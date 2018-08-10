%% Initialize EXIOBASE


%% concordance to macro_DB countries
concordance_EXIOBASE_macroDB = xlsread(ConcordanceXLScountries,'EXIOBASE','B2:AX215');
concordance_EXIOBASE_macroDB(isnan(concordance_EXIOBASE_macroDB)) = 0;

%% concordance to UN7
concordance_EXIOBASE_UN7 = xlsread(ConcordanceXLSsectors,'EXIO','B2:FH8');
concordance_EXIOBASE_UN7(isnan(concordance_EXIOBASE_UN7)) = 0;
 nreg = 49;
 nind = 163;
 nva = 1;
 nfd = 7; 
% 'Final consumption expenditure by households'
% 'Final consumption expenditure by non-profit organisations serving households (NPISH)'
HHNP = 1:2;
% 'Final consumption expenditure by government'
GOV = 3;
% 'Gross fixed capital formation'
% 'Changes in inventories'
% 'Changes in valuables'
GCF = 4:6;
% 'Exports: Total (fob)'



%% path to IO table
EXIOpath = '\\winfil.it.ntnu.no\EPT_eksperimentell\indecol\Projects\MRIOs\EXIOBASE3\EXIOBASE_3_6\Matlab structure\';
% load([EXIOpath,'IOT_',num2str(year),'_ixi.mat']);
% IO.Z = IO.A .* repmat(IO.x',size(IO.A,1),1);
