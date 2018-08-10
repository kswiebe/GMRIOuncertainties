%% load SNA comparison data
load([datapath,'\SNAstructure\EORA26values.mat']);
load([datapath,'\SNAstructure\UNSNAusdEORA26.mat']);

load([datapath,'\SNAstructure\EXIOvalues.mat']);
load([datapath,'\SNAstructure\UNSNAeurEXIO.mat']);

load([datapath,'\SNAstructure\ICIOvalues.mat']);
load([datapath,'\SNAstructure\UNSNAusdICIO.mat']);

load([datapath,'\SNAstructure\WIODvalues.mat']);
load([datapath,'\SNAstructure\UNSNAusdWIOD.mat']);



EORA26values_gr = makegrowthrate(EORA26values);
UNSNAusdEORA26_gr = makegrowthrate(UNSNAusdEORA26);

EXIOvalues_gr = makegrowthrate(EXIOvalues);
UNSNAeurEXIO_gr = makegrowthrate(UNSNAeurEXIO);

ICIOvalues = OECDvalues;
UNSNAusdICIO = UNSNAusdOECD;
ICIOvalues_gr = makegrowthrate(ICIOvalues);
UNSNAusdICIO_gr = makegrowthrate(UNSNAusdICIO);

WIODvalues_gr = makegrowthrate(WIODvalues);
UNSNAusdWIOD_gr = makegrowthrate(UNSNAusdWIOD);



