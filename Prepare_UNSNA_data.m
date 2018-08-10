%% load UNSNA data
% 1. the data used in EXIOBASE
%    a. load the data into [UNSNAeur2,UNSNAusd2]
%    b. use this to initialize the structs for the original data
% 2. the data downloaded from https://unstats.un.org/unsd/snaama/dnlList.asp
%    makes [UNSNAeur,UNSNAusd]

%% 1. Load the data used in EXIOBASE and initialize datacubes
[UNSNAeur2,UNSNAusd2] = loadUNSNAdataEXIOBASE();
%save([datapath,'\SNAstructure\UNSNAeur.mat'],'UNSNAeur');
%save([datapath,'\SNAstructure\UNSNAusd.mat'],'UNSNAusd');
%--> usd data is only created to get the struct


% dim1 = 214 countries
% dim2 = categories, see below
ncategories = 14;
% dim3 = 1995:2016
ntotyears = length(1995:2016);
% desc = {'curreny' 'EURO';'price_system' 'current';'version' '20171027';'git commit' '342c26c16a2cec0905c5a721282b9218108e7b39'}

% categories
%FCE
%HHNP
%GOV
%GCF
% 1 'Final consumption expenditure'
% 2 'Household consumption expenditure (including Non-profit institutions serving households)'
% 3 'General government final consumption expenditure'
% 4 'Gross capital formation'
% 5 'Exports of goods and services'
% 6 'Imports of goods and services'
% 7 'Gross Domestic Product (GDP)'
% 8 'Value Added: Agriculture, hunting, forestry, fishing (ISIC A-B)'
% 9 'Value Added: Mining, Manufacturing, Utilities (ISIC C-E)'
%10 'Value Added: Manufacturing (ISIC D)'
%11 'Value Added: Construction (ISIC F)'
%12 'Value Added: Wholesale, retail trade, restaurants and hotels (ISIC G-H)'
%13 'Value Added: Transport, storage and communication (ISIC I)'
%14 'Value Added: Other Activities (ISIC J-P)'
%15-21 Taxes and Subsidies

% ==> we add as 15, the sum of VA

%% 2. Reading UNSSNAusd data from newly downloaded data 
% https://unstats.un.org/unsd/snaama/dnlList.asp
% after sorting countries in Excel
% - move Cote d'Ivoire from between Costa Rica and Croatia to between Czech
%   Rep and DPR Korea
% - Delete Czechoslovakia
% - Delete Eithiopia (former)
% - Delete Sudan (former)
% - change order from Syria, Tajikistan, Macedonia to Syria, Macedonia
%   Tajikistan
% - Delete Yemen Arab
% - Delete Yemen Democratic
% - Delete Yugoslavia
% - add HH & I, G-H lines to CPR Korea
% - delete USSR (former)
% - add AB line to China, Macao
% - use ration from 2004 to fill D for China
% - add AB line to Monaco
% - add lines for Taiwan
% when saving as csv, make sure to add an x to yearnames: x1995 etc

UNSNAusd_long = readtable([thispath,'Data\UNSNA\Sorted2origcou.csv']);
gdp = UNSNAusd_long(ismember(UNSNAusd_long.IndicatorName,'Gross Domestic Product (GDP)'),:); % to get countrylist
exra = xlsread([thispath,'Data\UNSNA\ExchangeRateNCUGermanyUSD.xlsx'],'AD55:Ay55');
%UNSNAusd_long(isnan(UNSNAusd_long)) = 0;
%UNSNAusd_long_num = xlsread('C:\Users\kirstesw\Dropbox\CurrentWork\MRIOcritiquePaper\Data\UNSNA\Sorted2origcou.xlsx','C2:AW3615');
%UNSNAusd_long{:,3:end} = UNSNAusd_long_num;
%[~,UNSNAusd_long_names,~] = xlsread('C:\Users\kirstesw\Dropbox\CurrentWork\MRIOcritiquePaper\Data\UNSNA\Sorted2origcou.xlsx','A2:B3615');
%[~,index]=ismember(UNSNAusd_long_names,'Household consumption expenditure (including Non-profit institutions serving households)');
UNSNAusd = UNSNAusd2;
UNSNAusd.val(:,:,:) = 0;
UNSNAeur = UNSNAeur2;
UNSNAeur.val(:,:,:) = 0;
[UNSNAusd,UNSNAeur] = sortUNSNAxls(UNSNAusd_long,UNSNAusd,UNSNAeur,exra);

save([thispath,'Data\SNAstructure\UNSNAusd.mat'],'UNSNAusd');
save([thispath,'Data\SNAstructure\UNSNAeur.mat'],'UNSNAeur');

save([thispath,'Data\SNAstructure\UNSNAusd2.mat'],'UNSNAusd2');
save([thispath,'Data\SNAstructure\UNSNAeur2.mat'],'UNSNAeur2');