%% Initialize OECD ICIO62

%% concordance to macro_DB
concordance_ICIO_macroDB = xlsread(ConcordanceXLScountries,'ICIO62','B2:BK215');
concordance_ICIO_macroDB(isnan(concordance_ICIO_macroDB)) = 0;


%% concordance to UN7
concordance_ICIO_UN7 = xlsread(ConcordanceXLSsectors,'ICIO','B2:AI8');
concordance_ICIO_UN7(isnan(concordance_ICIO_UN7)) = 0;
nreg = 62; %one RoW as Statistical Discrepencies
nind = 34;
nva = 1;
nfd = 6;
% 1 Household Final Consumption Expenditure
% 2 Non-Profit Institutions Serving Households
HHNP = [1:2,6];
% 3 General Government Final Consumption
GOV = 3;
% 4 Gross Fixed Capital Formation
% 5 Changes in Inventories and Valuables
GCF = 4:5;
% 6 Direct purchases by non-residents

%% path to IO table
OECDICIOpath = '\\winfil.it.ntnu.no\EPT_eksperimentell\indecol\Projects\MRIOs\OECD\Matlab_Structure\';

%OECDtry = load([OECDICIOpath,'OECD_62_2011_ZF.mat']);
%OECDICIOpath = '\\winfil.it.ntnu.no\EPT_eksperimentell\indecol\Projects\MRIOs\OECD\Matlab_Structure_May2018\';

%load([OECDICIOpath,'OECDICIO_',num2str(year),'.mat']);
% IO.V = IO.V';