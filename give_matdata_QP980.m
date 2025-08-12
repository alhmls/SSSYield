function [Matdata] = give_matdata_QP980(eps)
%  A non-quadratic pressure-sensitive constitutive model under 
%   non-associated flow rule with anisotropic hardening: Modeling 
%   and validation 

mdata=...
    [850.3 329.8 17.1 0.96 763.8 0.292 ;
     915.8 390.4 14.2 0.93 606.7 0.244 ;
     875.0 350.2 16.4 0.96 646.0 0.241 ;
     823.7 266.5 19.1 0.95 852.1 0.322 ;
     796.4 278.4 15.9 0.95 802.0 0.256 ;
     827.8 312.7 16.2 0.93 758.1 0.256 ;
     791.4 272.2 16.7 0.89 910.2 0.301;
     631.0 178.7 1228.4 1.14 1345.7 0.412 ;
     755.3 253.7 221.0 0.85 1348.8 0.530 ;
     683.2 161.2 1424.9 1.16 1315.1 0.424;
     29.9 168.1 188.0 1.72 1458.2 0.098 ;
     17.4 156.7 210.3 1.75 1459.9 0.098 ;
     625.7 119.5 4512.0 1.11 1900.3 0.398 ;
     219.5 127.8 5.45 0.12 703.3 0.217;
     219.1 36.8 1.99 0.20 732.6 0.204 ;
     641.2 112.4 7637.2 1.31 1837.3 0.372 ;
     569.9 171.8 14.7 1.02 294.1 0.334 
     ];

Matdata.Txy00=mdata(1,1)-mdata(1,2)*exp(-mdata(1,3)*eps^mdata(1,4))+mdata(1,5)*eps^mdata(1,6);
Matdata.Txy15=mdata(2,1)-mdata(2,2)*exp(-mdata(2,3)*eps^mdata(2,4))+mdata(2,5)*eps^mdata(2,6);
Matdata.Txy30=mdata(3,1)-mdata(3,2)*exp(-mdata(3,3)*eps^mdata(3,4))+mdata(3,5)*eps^mdata(3,6);
Matdata.Txy45=mdata(4,1)-mdata(4,2)*exp(-mdata(4,3)*eps^mdata(4,4))+mdata(4,5)*eps^mdata(4,6);
Matdata.Txy60=mdata(5,1)-mdata(5,2)*exp(-mdata(5,3)*eps^mdata(5,4))+mdata(5,5)*eps^mdata(5,6);
Matdata.Txy75=mdata(6,1)-mdata(6,2)*exp(-mdata(6,3)*eps^mdata(6,4))+mdata(6,5)*eps^mdata(6,6);
Matdata.Txy90=mdata(7,1)-mdata(7,2)*exp(-mdata(7,3)*eps^mdata(7,4))+mdata(7,5)*eps^mdata(7,6);
Matdata.Cxy00=mdata(8,1)-mdata(8,2)*exp(-mdata(8,3)*eps^mdata(8,4))+mdata(8,5)*eps^mdata(8,6);
Matdata.Cxy45=mdata(9,1)-mdata(9,2)*exp(-mdata(9,3)*eps^mdata(9,4))+mdata(9,5)*eps^mdata(9,6);
Matdata.Cxy90=mdata(10,1)-mdata(10,2)*exp(-mdata(10,3)*eps^mdata(10,4))+mdata(10,5)*eps^mdata(10,6);
Matdata.TEBX=mdata(11,1)-mdata(11,2)*exp(-mdata(11,3)*eps^mdata(11,4))+mdata(11,5)*eps^mdata(11,6);
Matdata.TEBY=mdata(12,1)-mdata(12,2)*exp(-mdata(12,3)*eps^mdata(12,4))+mdata(12,5)*eps^mdata(12,6);
Matdata.TPS00X=mdata(13,1)-mdata(13,2)*exp(-mdata(13,3)*eps^mdata(13,4))+mdata(13,5)*eps^mdata(13,6);
Matdata.TPS00Y=mdata(14,1)-mdata(14,2)*exp(-mdata(14,3)*eps^mdata(14,4))+mdata(14,5)*eps^mdata(14,6);
Matdata.TPS90X=mdata(15,1)-mdata(15,2)*exp(-mdata(15,3)*eps^mdata(15,4))+mdata(15,5)*eps^mdata(15,6);
Matdata.TPS90Y=mdata(16,1)-mdata(16,2)*exp(-mdata(16,3)*eps^mdata(16,4))+mdata(16,5)*eps^mdata(16,6);
Matdata.SS00=mdata(17,1)-mdata(17,2)*exp(-mdata(17,3)*eps^mdata(17,4))+mdata(17,5)*eps^mdata(17,6);

if eps==0.2
    Matdata.Txy00=659.1;
    Matdata.Txy45=685.9;
    Matdata.Txy90=676.8;
    Matdata.TEBX=655.5;
    Matdata.SS00=439.4;
    Matdata.Cxy00=671.1;
    Matdata.Cxy90=721.4;
    
    
end
    
Matdata.TEB=Matdata.TEBX;

Matdata.CEB=(Matdata.Cxy00+Matdata.Cxy45*2+Matdata.Cxy90)/4;

Matdata.sigT00=Matdata.Txy00;
Matdata.sigT15=Matdata.Txy15;
Matdata.sigT30=Matdata.Txy30;
Matdata.sigT45=Matdata.Txy45;
Matdata.sigT60=Matdata.Txy60;
Matdata.sigT75=Matdata.Txy75;
Matdata.sigT90=Matdata.Txy90;


Matdata.sigC00=Matdata.Cxy00;
Matdata.sigC45=Matdata.Cxy45;
Matdata.sigC90=Matdata.Cxy90;


Matdata.sigBT= Matdata.TEBX;


Matdata.sigBC=Matdata.CEB;
Matdata.sigUT=Matdata.sigT00;
Matdata.sigPST=Matdata.TPS00X;

Matdata.sigUC=Matdata.sigC90 ;
Matdata.sigBT=Matdata.TEB;
Matdata.sigSS=Matdata.SS00;

end

