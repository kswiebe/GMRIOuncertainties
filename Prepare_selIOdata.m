%% Prepare selected IO data

%% ICIO62
run('Initialize_ICIO62.m');

%ITA and USA
ita = 17;
usa = 34;
selcou = [ita, usa];
selyear = 2010;

year = selyear;
load([OECDICIOpath,'OECD_62_',num2str(year),'_ZF.mat']);
IO.V = IO.V';
selIO_ICIO62 = getnatIO(IO,selcou,nreg,nind,nfd);
save([datapath,'\selIO\selIO_ICIO62.mat'],'selIO_ICIO62');

%% WIOD
run('Initialize_WIOD.m');

%ITA and USA
ita = 22;
usa = 40;
selcou = [ita, usa];
selyear = 2010;

year = selyear;
load([WIODpath,'WIOD_ixi_',num2str(year),'_ZVYF.mat']);

selIO_WIOD = getnatIO(IO,selcou,nreg,nind,nfd);
save([datapath,'\selIO\selIO_WIOD.mat'],'selIO_WIOD');
%% Eora26
run('Initialize_Eora26.m');

%ITA and USA
ita = 85;
usa = 181;
selcou = [ita, usa];
selyear = 2010;

year = selyear;

load([EORA26path,'mrio_',num2str(year),'_ZVYF.mat']);
% get rid of ROW statistical dscrepancies
IO.Y = IO.Y(1:nri,:);
IO.Z = IO.Z(1:nri,1:nri);
IO.V = IO.V(:,1:nri);
IO.x = IO.x(1:nri,:);

selIO_Eora26 = getnatIO(IO,selcou,nreg,nind,nfd);
save([datapath,'\selIO\selIO_Eora26.mat'],'selIO_Eora26');

%% EXIOBASE
run('Initialize_EXIO.m');

%ITA and USA
ita = 16;
usa = 29;
selcou = [ita, usa];
selyear = 2010;

year = selyear;
load([EXIOpath,'IOT_',num2str(year),'_ixi.mat']);
IO.Z = IO.A .* repmat(IO.x',size(IO.A,1),1);

selIO_EXIO = getnatIO(IO,selcou,nreg,nind,nfd);
save([datapath,'\selIO\selIO_EXIO.mat'],'selIO_EXIO');
