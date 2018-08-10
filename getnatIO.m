function selIO = getnatIO(IO,selcou,nreg,nind,nfd)
    
for c = selcou
    ci1 = (c-1)*nind+1;
    ci2 = c*nind;
    cfd1 = (c-1)*nfd+1;
    cfd2 = c*nfd;
    selIO(c).Zdom = IO.Z(ci1:ci2,ci1:ci2);
    selIO(c).Ydom = IO.Y(ci1:ci2,cfd1:cfd2);
    temp = zeros(nind,nind);
    tempfd = zeros(nind,nfd);
    for exp = 1:nreg
        exp1 = (exp-1)*nind+1;
        exp2 = exp*nind;
        temp = temp + IO.Z(exp1:exp2,ci1:ci2);
        tempfd = tempfd + IO.Y(exp1:exp2,cfd1:cfd2);
    end
    selIO(c).Ztot = temp;
    selIO(c).Ytot = tempfd;
    selIO(c).Zimp = selIO(c).Ztot - selIO(c).Zdom;
    selIO(c).Yimp = selIO(c).Ytot - selIO(c).Ydom;
    selIO(c).VA = sum(IO.V(:,ci1:ci2),1);
end 


end