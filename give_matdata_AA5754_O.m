function [Matdata] = give_matdata_AA5754_O (eps)
%  A non-quadratic pressure-sensitive constitutive model under 
%   non-associated flow rule with anisotropic hardening: Modeling 
%   and validation 

mdata=...
    [296.5 205.1 8.87 0.85 0  ;
     287.2 201.5 9.04 0.85 0  ;
     289.1 203.7 7.93 0.82 0;
     291.2 205.0 8.31 0.84 0;
     276.9 188.7 10.17 0.90 0 ;
    288.7 207.2 7.66 0.81  0;
     290.7 204.4 8.45 0.84 0;
    277.9 187.2 9.73 0.86  0;
     283.5 197.2 9.38 0.86 0 ;
     277.1 183.2 10.29 0.88 0 ;
     254.5 154.8 21.95 1.03 0  ;
     257.1 157.7 21.60 1.03 0  ;
    321.9 219.2 8.28 0.83 0  ;
     132.6 81.1 11.53 0.84 0 ;
     113.0 61.5 24.46 0.99 0  ;
     267.3 164.8 15.56 0.95 0  ;
    161.1 106.7 8.31 0.81 0
     ];

Matdata.Txy00=mdata(1,1)-mdata(1,2)*exp(-mdata(1,3)*eps^mdata(1,4));
Matdata.Txy15=mdata(2,1)-mdata(2,2)*exp(-mdata(2,3)*eps^mdata(2,4));
Matdata.Txy30=mdata(3,1)-mdata(3,2)*exp(-mdata(3,3)*eps^mdata(3,4));
Matdata.Txy45=mdata(4,1)-mdata(4,2)*exp(-mdata(4,3)*eps^mdata(4,4));
Matdata.Txy60=mdata(5,1)-mdata(5,2)*exp(-mdata(5,3)*eps^mdata(5,4));
Matdata.Txy75=mdata(6,1)-mdata(6,2)*exp(-mdata(6,3)*eps^mdata(6,4));
Matdata.Txy90=mdata(7,1)-mdata(7,2)*exp(-mdata(7,3)*eps^mdata(7,4));
Matdata.Cxy00=mdata(8,1)-mdata(8,2)*exp(-mdata(8,3)*eps^mdata(8,4));
Matdata.Cxy45=mdata(9,1)-mdata(9,2)*exp(-mdata(9,3)*eps^mdata(9,4));
Matdata.Cxy90=mdata(10,1)-mdata(10,2)*exp(-mdata(10,3)*eps^mdata(10,4));
Matdata.TEBX=mdata(11,1)-mdata(11,2)*exp(-mdata(11,3)*eps^mdata(11,4));
Matdata.TEBY=mdata(12,1)-mdata(12,2)*exp(-mdata(12,3)*eps^mdata(12,4));
Matdata.TPS00X=mdata(13,1)-mdata(13,2)*exp(-mdata(13,3)*eps^mdata(13,4));
Matdata.TPS00Y=mdata(14,1)-mdata(14,2)*exp(-mdata(14,3)*eps^mdata(14,4));
Matdata.TPS90X=mdata(15,1)-mdata(15,2)*exp(-mdata(15,3)*eps^mdata(15,4));
Matdata.TPS90Y=mdata(16,1)-mdata(16,2)*exp(-mdata(16,3)*eps^mdata(16,4));
Matdata.SS00=mdata(17,1)-mdata(17,2)*exp(-mdata(17,3)*eps^mdata(17,4));


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

Matdata.sigBC=Matdata.CEB;
Matdata.sigUT=Matdata.sigT00;
Matdata.sigPST=Matdata.TPS00X;
Matdata.TPS90=Matdata.TPS90Y;

Matdata.sigUC=Matdata.sigC90 ;
Matdata.sigBT=Matdata.TEB;
Matdata.sigSS=Matdata.SS00;
Matdata.RT00=0.65;
Matdata.RT45=0.65;
Matdata.RT90=0.72;
Matdata.RC00=0.60;
Matdata.RC45=0.75;
Matdata.RC90=0.62;

end

