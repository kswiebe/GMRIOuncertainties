function [UNSNAeur,UNSNAusd] = loadUNSNAdataEXIOBASE()
    path = 'X:\indecol\Projects\DESIRE\wp5_eeio\macro_db\fin\';
    load([path,'macro_all_curr_euro.mat']);
    UNSNAeur = macro_all_curr_euro;
    UNSNAeur.dim2 = macro_all_curr_euro.dim2(1:14,:); % only 14 as TAX+SUBS goes to VA
    UNSNAeur.val = macro_all_curr_euro.val(:,1:14,:); % only 14 as TAX+SUBS goes to VA
    
%  1 'Final consumption expenditure'
%  2 'Household consumption expenditure (including Non-profit institutions serving households)'
%  3 'General government final consumption expenditure'
%  4 'Gross capital formation'
%  5 'Exports of goods and services'
%  6 'Imports of goods and services'
%  7 'Gross Domestic Product (GDP)'
%  8 'Value Added: Agriculture, hunting, forestry, fishing (ISIC A-B)'
%  9 'Value Added: Mining, Manufacturing, Utilities (ISIC C-E)'
% 10 'Value Added: Manufacturing (ISIC D)'

% ==> get D out of C-E
UNSNAeur.val(:,9,:) = macro_all_curr_euro.val(:,9,:) - macro_all_curr_euro.val(:,10,:);

% 11 'Value Added: Construction (ISIC F)'
% 12 'Value Added: Wholesale, retail trade, restaurants and hotels (ISIC G-H)'
% 13 'Value Added: Transport, storage and communication (ISIC I)'
% 14 'Value Added: Other Activities (ISIC J-P)'

% 15 'Taxes and Subs: Agriculture, hunting, forestry, fishing (ISIC A-B)'
% 16 'Taxes and Subs: Mining, Manufacturing, Utilities (ISIC C-E)'
% 17 'Taxes and Subs: Manufacturing (ISIC D)'

% ==> get D out of C-E
 macro_all_curr_euro.val(:,16,:) =  macro_all_curr_euro.val(:,16,:) - macro_all_curr_euro.val(:,17,:); 

% 18 'Taxes and Subs: Construction (ISIC F)'
% 19 'Taxes and Subs: Wholesale, retail trade, restaurants and hotels (ISIC G-H)'
% 20 'Taxes and Subs: Transport, storage and communication (ISIC I)'
% 21 'Taxes and Subs: Other Activities (ISIC J-P)'

% ==> add taxes and subsidies to VA
UNSNAeur.val(:,8:14,:) = UNSNAeur.val(:,8:14,:) + macro_all_curr_euro.val(:,15:21,:);
UNSNAeur.val(:,15,:) = sum(UNSNAeur.val(:,8:14,:),2);
    
    
    % convert to USD (after the eur changes have been made)
        % load exchange rate
        load([path,'euro_to_usd.mat']); % 1995 - 2015 is entries 25:45
        
        % initialize
        UNSNAusd = UNSNAeur;
        UNSNAusd.val(:,:,:) = 0;
        UNSNAusd.desc(1,2) = cellstr('USD');
        
        % sort exchange rate values to have same structure as *.val
        repeated = repmat(euro_to_usd.val(25:45),[214,1,size(UNSNAeur.val,2)]);
        sorted = permute(repeated,[1,3,2]);
        
        % then convert values
        UNSNAusd.val = UNSNAeur.val(:,:,1:21) .* sorted;
        
    
end