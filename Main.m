% This is the main script for the estimation of the uncertainties in the
% global MRIO databases

% May 16, 2018

% Kirsten S. Wiebe
% Moana S. Simas
% Anne Owen

%% how to run this
% If the data is not 

%% Table of contents

% 0. Initializations

% 1. Macro-level assessment comparing to UNSNA
% 1.1 Preparing the data
prepareMacroData = 0; % if this is zero, it should run on all computers
% 1.2 Do the macro-economic analysis

% 2. Symmetric IOT analysis
% 2.1 Prepare selected IO data (ITA & USA)
update_selIO = 0; % if this is zero, it should run on all computers
% 2.2 Prepare selected EUROSTAT and USBEA data

%% 0. Initializations

% paths
thispath = 'C:\Users\kirstesw\Dropbox\CurrentWork\MRIOcritiquePaper\';
cd([thispath,'Matlab']);
addpath([thispath,'Data']);
datapath = [thispath,'Data'];
addpath([thispath,'\Data\meta&concordances']);

% concordance matrices
ConcordanceXLSsectors = 'ConcordanceSectors.xlsx';
ConcordanceXLScountries = 'ConcordanceCountries.xlsx';
[~,EXIOcountries] = xlsread(ConcordanceXLScountries,'EXIOBASE','B1:AX1');
[~,WIODcountries] = xlsread(ConcordanceXLScountries,'WIOD','B1:AP1');
[~,ICIO62countries] = xlsread(ConcordanceXLScountries,'ICIO62','B1:BK1');
[~,EORA26countries] = xlsread(ConcordanceXLScountries,'EORA26','B1:GH1');

% Matrix comparison statistics
addpath('C:\Users\kirstesw\Dropbox\KirstenCODE\MatrixComparison'); % not used yet

%% 1. Macro-level assessment comparing to UNSNA
% comparing the MRIO data to the UN SNA main aggregates
SNAnames = {'FCE','HH','GOV','GCF','EXP','IMP','GDP','AGR','MIU','MAN','CON','WTR','TSC','SER','TVA'};
selsna = [2:6,8:14];
%% 1.1 Preparing the data

if prepareMacroData == 1
    %% 1.1.1 Loading the UN SNA data 
    run('Prepare_UNSNA_data.m');
    % makes
    % [UNSNAeur,UNSNAusd]
    % [UNSNAeur2,UNSNAusd2]

    %% 1.1.2 WIOD
    run('Compare_UNSNA_WIOD.m')

    %% 1.1.3 EORA26
    run('Compare_UNSNA_Eora26.m')

    %% 1.1.4 OECD ICIO
    run('Compare_UNSNA_ICIO62.m')

    %% 1.1.5EXIOBASE
    run('Compare_UNSNA_EXIO.m')

else %end % prepare Macrodata
    run('load_SNA_comparison_data.m'); % also makes growth rates
end

%% 1.2 Do the macro-economic analysis



%% 1.2.1 Boxplots

% OECD versus UN SNA main aggregates
run('Compare_OECD_UN_SNA.m');

%makeSNAcompFigure(OTHERdata,UNSNAdata,SNAnames,OTHERname,ylimit)
makeSNAcompFigure(ICIOvalues,UNSNAusdICIO,SNAnames,'ICIO',[0,2])
makeSNAcompFigure(WIODvalues,UNSNAusdWIOD,SNAnames,'WIOD',[0,2])
makeSNAcompFigure(EXIOvalues,UNSNAeurEXIO,SNAnames,'EXIOBASE',[0,2])
makeSNAcompFigure(EORA26values,UNSNAusdEORA26,SNAnames,'Eora26',[0,20])
makeSNAcompFigure(EORA26values,UNSNAusdEORA26,SNAnames,'Eora26',[0,2])

%% 1.2.2 Matrix difference statistics
% simple correlation
run('makeSimpleCorrelbyCountry.m');

% not super exciting
%run('makeSimpleScatterPlots.m');


%% 2. Symmetric IOT analysis

%% 2.1 Prepare selected IO data (ITA & USA)

if update_selIO == 1
    run('Prepare_selIO.m');
else
    %run(load_selIO_data.m);
end
%% Loading EUROSTAT data
%EUROSTATxlspath =  '\\winfil.it.ntnu.no\EPT_eksperimentell\indecol\Projects\DESIRE\wp5_eeio\raw_data_download\tno\aggregate_MSUTs\excel\';
%EUROSTATcou = xlsread(




