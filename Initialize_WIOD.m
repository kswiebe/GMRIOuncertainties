%% Initialize WIOD


%% concordance to macro_DB
concordance_WIOD_macroDB = xlsread(ConcordanceXLScountries,'WIOD','B2:AP215');
concordance_WIOD_macroDB(isnan(concordance_WIOD_macroDB)) = 0;

%% concordance to UN7
concordance_WIOD_UN7 = xlsread(ConcordanceXLSsectors,'WIOD','C2:AK8');
concordance_WIOD_UN7(isnan(concordance_WIOD_UN7)) = 0;
 nreg = 41;
 nind = 35;
 nva = 1;
 nfd = 5; 
 
 % meta has wrong order
%  {'Final consumption expenditure by non-profit organisations serving households (NPISH)';'Final consumption expenditure by government';'Gross fixed capital formation';'Changes in inventories and valuables';'Final consumption expenditure by households'}

% alternative
HHNP = 1:2;
GOV = 3;
GCF = 4:5;
 
%% path to IO table
WIODpath = '\\winfil.it.ntnu.no\EPT_eksperimentell\indecol\Projects\MRIOs\WIOD\v2013.413\';
%load([WIODpath,'WIOD_ixi_2011_AxYS.mat']);
% WIOD = load([WIODpath,'WIOD_ixi_2011_ZVYF.mat']);
% IO = WIOD.IO;

%load([WIODpath,'WIOD_ixi_',num2str(year),'_ZVYF.mat']);
