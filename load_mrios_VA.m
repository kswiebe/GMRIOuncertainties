function [mrio_table] = load_mrios_VA(reg_names)

%% Compensation of Employees from EXIOBASE

load('\\winfil.it.ntnu.no\EPT_eksperimentell\indecol\Projects\MRIOs\EXIOBASE3\EXIOBASE_3_6\Matlab structure\IOT_1995_ixi.mat', 'meta')
    years_EXIO = (1995:2015)';
    
    Region = meta.secLabsZ.Country;
    Industry = meta.secLabsZ.CodeTxt;
    
clear meta 

mrio.EXIOBASE = [];
for y=1:size(years_EXIO,1)
   
    load(['\\winfil.it.ntnu.no\EPT_eksperimentell\indecol\Projects\MRIOs\EXIOBASE3\EXIOBASE_3_6\Matlab structure\IOT_',num2str(years_EXIO(y)),'_ixi.mat']);
    Values = (sum(IO.V(1:12,:)))';
    Year = repmat(years_EXIO(y),size(Values,1),1);
    
    VA_Year = table(Region,Year,Industry,Values);
    
    
    mrio.EXIOBASE = vertcat(mrio.EXIOBASE,VA_Year); 
end

clear IO meta y

% Change region codes from A2 to A3 
for r=1:size(reg_names,1)
    mrio.EXIOBASE.Region(ismember(mrio.EXIOBASE.Region,reg_names.Regions_A2(r))) = reg_names.Regions_A3(r);
end

%% Value Added from WIOD v.2013
load('\\winfil.it.ntnu.no\EPT_eksperimentell\indecol\Projects\MRIOs\OECD\Matlab_Structure\OECD_62_1995_AS.mat', 'meta')
    years_ICIO = meta.years';
    
    Region = meta.labsZ(:,2);
    Industry = meta.labsZ(:,4);
    
clear meta 

mrio.ICIO = [];
for y=1:size(years_ICIO,1)
   
%     disp(num2str(years_ICIO(y)));
    load(['\\winfil.it.ntnu.no\EPT_eksperimentell\indecol\Projects\MRIOs\OECD\Matlab_Structure\OECD_62_',num2str(years_ICIO(y)),'_AS.mat']);
    Values = IO.V;
    Year = repmat(years_ICIO(y),size(Values,1),1);
    
    VA_Year = table(Region,Year,Industry,Values);
    
    
    mrio.ICIO = vertcat(mrio.ICIO,VA_Year); 
end

clear IO meta y

%% Value Added from WIOD v.2013
load('\\winfil.it.ntnu.no\EPT_eksperimentell\indecol\Projects\MRIOs\WIOD\v2013.413\WIOD_ixi_1995_AxYS.mat', 'meta')
    years_WIODv2013 = meta.years';
    
    Region = meta.labsZ(:,2);
    Industry = meta.secLabsZ(:,4);
    
clear meta 

mrio.WIOD_v13 = [];
for y=1:size(years_WIODv2013,1)
   
%     disp(num2str(years_WIODv2013(y)));
    load(['\\winfil.it.ntnu.no\EPT_eksperimentell\indecol\Projects\MRIOs\WIOD\v2013.413\WIOD_ixi_',num2str(years_WIODv2013(y)),'_AxYS.mat']);
    Values = IO.V';
    Year = repmat(years_WIODv2013(y),size(Values,1),1);
    
    VA_Year = table(Region,Year,Industry,Values);
    
    
    mrio.WIOD_v13 = vertcat(mrio.WIOD_v13,VA_Year); 
end

clear IO meta y
%% Value Added from WIOD v.2013
% load('\\winfil.it.ntnu.no\EPT_eksperimentell\indecol\Projects\MRIOs\WIOD\v2016\WIOD_ixi_2000_AxYS.mat', 'meta')
%     years_WIODv2016 = meta.years';
%     
%     Region = meta.labsZ(:,2);
%     Industry = meta.secLabsZ(:,4);
%     
% clear meta 
% 
% WIODv2016 = [];
% for y=1:size(years_WIODv2016,1)
%    
% %     disp(num2str(years_WIODv2016(y)));
%     load(['\\winfil.it.ntnu.no\EPT_eksperimentell\indecol\Projects\MRIOs\WIOD\v2013.413\WIOD_ixi_',num2str(years_WIODv2016(y)),'_AxYS.mat']);
%     Values = IO.V';
%     Year = repmat(years_WIODv2016(y),size(Values,1),1);
%     
%     VA_Year = table(Region,Year,Industry,Values);
%     
%     
%     WIODv2016 = vertcat(WIODv2016,VA_Year); 
% end
% 
% clear IO meta y


%% put them all into one table 

databases = fieldnames(mrio); 

mrio_table = [];
for i=1:size(databases,1)
   
    mrio.(databases{i}).Database = cellstr(repmat(databases{i},size(mrio.(databases{i}),1),1));
    mrio_table = vertcat(mrio_table,mrio.(databases{i}));
    
end
