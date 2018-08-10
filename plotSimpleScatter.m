function plotSimpleScatter(temp1,temp2,titlename)

values_long = temp1(:);
UNSNA_long = temp2(:);


plot(UNSNA_long,UNSNA_long,'*')

%    xlim(symmetriclimits);
%    ylim(symmetriclimits);

title(titlename);

end