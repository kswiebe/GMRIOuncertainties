function [values] = calcSNAvalues(IO,nreg,nind,nfd,HHNP,GOV,GCF,concordance_UN7)

    for c = 1:nreg
        ci1 = (c-1)*nind+1;
        ci2 = c*nind;
        % 1 'Final consumption expenditure'
        cfd0 = (c-1)*nfd;
        cfd1 = (c-1)*nfd+1;
        cfd2 = c*nfd;
        %values(c,1,t) = sum(sum(IO.Y(:,cfd1:cfd2)));
        % 2 'Household consumption expenditure (including Non-profit institutions serving households)'
        values(c,2) = sum(sum(IO.Y(:,cfd0+HHNP)));
        % 3 'General government final consumption expenditure'
        values(c,3) = sum(sum(IO.Y(:,cfd0+GOV)));
        % 4 'Gross capital formation'
        values(c,4) = sum(sum(IO.Y(:,cfd0+GCF)));
        
        values(c,1) = sum(values(c,2:4));
        
        % 5 'Exports of goods and services'        
        % 6 'Imports of goods and services'
        domINT = sum(sum(IO.Z(ci1:ci2,ci1:ci2)));
        expINT = sum(sum(IO.Z(ci1:ci2,:))) - domINT;
        impINT = sum(sum(IO.Z(:,ci1:ci2))) - domINT;
        domFD = sum(sum(IO.Y(ci1:ci2,cfd1:cfd2)));
        expFD = sum(sum(IO.Y(ci1:ci2,:))) - domFD;
        impFD = sum(sum(IO.Y(:,cfd1:cfd2))) - domFD;
        values(c,5) = expINT + expFD;
        values(c,6) = impINT + impFD;
        % 7 'Gross Domestic Product (GDP)' 
        %    = final consumption + exports - imports
        values(c,7) = values(c,1) + values(c,5) - values(c,6);
        
        % Value added 
        % 8 'Value Added: Agriculture, hunting, forestry, fishing (ISIC A-B)'
        % 9 'Value Added: Mining, Manufacturing, Utilities (ISIC C-E)'
        %10 'Value Added: Manufacturing (ISIC D)'
        %11 'Value Added: Construction (ISIC F)'
        %12 'Value Added: Wholesale, retail trade, restaurants and hotels (ISIC G-H)'
        %13 'Value Added: Transport, storage and communication (ISIC I)'
        %14 'Value Added: Other Activities (ISIC J-P)'
        va = sum(IO.V(:,ci1:ci2),1);
        %values(c,8:14,t) = concordance_ICIO_UN7*va';
        %values(c,8:14,t) = concordance_EXIOBASE_UN7*va';
        values(c,8:14) = concordance_UN7*va';
        values(c,15) = sum(values(c,8:14),2);
     end % for c
     
end % function