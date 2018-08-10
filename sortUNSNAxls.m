function [UNSNAusd,UNSNAeur] = sortUNSNAxls(UNSNAusd_long,UNSNAusd,UNSNAeur,exra)

%hhcou = UNSNAusd_long(ismember(UNSNAusd_long.IndicatorName,'Household consumption expenditure (including Non-profit institutions serving households)'),:);
temp.hh = UNSNAusd_long(ismember(UNSNAusd_long.IndicatorName,'Household consumption expenditure (including Non-profit institutions serving households)'),28:48);
temp.go = UNSNAusd_long(ismember(UNSNAusd_long.IndicatorName,'General government final consumption expenditure'),28:48);
temp.gc = UNSNAusd_long(ismember(UNSNAusd_long.IndicatorName,'Gross capital formation'),28:48);
temp.ex = UNSNAusd_long(ismember(UNSNAusd_long.IndicatorName,'Exports of goods and services'),28:48);
temp.im = UNSNAusd_long(ismember(UNSNAusd_long.IndicatorName,'Imports of goods and services'),28:48);
temp.gdp = UNSNAusd_long(ismember(UNSNAusd_long.IndicatorName,'Gross Domestic Product (GDP)'),28:48);
temp.ab = UNSNAusd_long(ismember(UNSNAusd_long.IndicatorName,'Agriculture, hunting, forestry, fishing (ISIC A-B)'),28:48);
temp.cde = UNSNAusd_long(ismember(UNSNAusd_long.IndicatorName,'Mining, Manufacturing, Utilities (ISIC C-E)'),28:48);
temp.d = UNSNAusd_long(ismember(UNSNAusd_long.IndicatorName,'Manufacturing (ISIC D)'),28:48);
temp.f = UNSNAusd_long(ismember(UNSNAusd_long.IndicatorName,'Construction (ISIC F)'),28:48);
temp.gh = UNSNAusd_long(ismember(UNSNAusd_long.IndicatorName,'Wholesale, retail trade, restaurants and hotels (ISIC G-H)'),28:48);
temp.ii = UNSNAusd_long(ismember(UNSNAusd_long.IndicatorName,'Transport, storage and communication (ISIC I)'),28:48);
temp.jp = UNSNAusd_long(ismember(UNSNAusd_long.IndicatorName,'Other Activities (ISIC J-P)'),28:48);
temp.va = UNSNAusd_long(ismember(UNSNAusd_long.IndicatorName,'Total Value Added'),28:48);

temp.ce = table2array(temp.cde) - table2array(temp.d);

UNSNAusd.val(:,2,:) = table2array(temp.hh);
UNSNAusd.val(:,3,:) = table2array(temp.go);
UNSNAusd.val(:,4,:) = table2array(temp.gc);
UNSNAusd.val(:,5,:) = table2array(temp.ex);
UNSNAusd.val(:,6,:) = table2array(temp.im);
UNSNAusd.val(:,7,:) = table2array(temp.gdp);
UNSNAusd.val(:,8,:) = table2array(temp.ab);
UNSNAusd.val(:,9,:) = temp.ce;
UNSNAusd.val(:,10,:) = table2array(temp.d);
UNSNAusd.val(:,11,:) = table2array(temp.f);
UNSNAusd.val(:,12,:) = table2array(temp.gh);
UNSNAusd.val(:,13,:) = table2array(temp.ii);
UNSNAusd.val(:,14,:) = table2array(temp.jp);
UNSNAusd.val(:,15,:) = table2array(temp.va);

UNSNAusd.val(isnan(UNSNAusd.val)) = 0;

for t = 1:size(UNSNAusd.val,3)
    UNSNAeur.val(:,:,t) = UNSNAusd.val(:,:,t) * exra(t);
end

end