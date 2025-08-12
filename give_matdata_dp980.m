function Matdata=give_matdata_dp980(eps)
%  A non-quadratic pressure-sensitive constitutive model under 
%   non-associated flow rule with anisotropic hardening: Modeling 
%   and validation 
mdata=[1174.6 1030.6 5.57 0.32 ;
    1151.9 939.4 6.74 0.35;
    1168.7 992.9 5.83 0.32 ;
    1130.2 1111.5 6.88 0.31;
    1260.9 1386.9 4.10 0.23 ;
    1202.6 1237.7 5.24 0.27 ;
    1142.3 827.5 9.55 0.44 ;
1130.0 811.6 10.07 0.44;
1203.2 831.2 12.57 0.47 ;
562.2 365.3 18.43 0.52 ;
581.1 391.5 18.35 0.52 ;
1229.2 877.1 12.83 0.47 ;
693.3 585.7 4.85 0.30  ];

mdata15=[1165.8 804.7 7.30 0.41 ];
mdata30=[1180.2 944.3 6.24 0.36  ];
mdata60=[1182.5 956.0 6.26 0.36 ];
mdata75=[1193.3 1037.0 5.87 0.33 ];

Matdata.Txy00=mdata(1,1)-mdata(1,2)*exp(-mdata(1,3)*eps^mdata(1,4));
Matdata.Txy45=mdata(2,1)-mdata(2,2)*exp(-mdata(2,3)*eps^mdata(2,4));
Matdata.Txy90=mdata(3,1)-mdata(3,2)*exp(-mdata(3,3)*eps^mdata(3,4));
Matdata.Cxy00=mdata(4,1)-mdata(4,2)*exp(-mdata(4,3)*eps^mdata(4,4));
Matdata.Cxy45=mdata(5,1)-mdata(5,2)*exp(-mdata(5,3)*eps^mdata(5,4));
Matdata.Cxy90=mdata(6,1)-mdata(6,2)*exp(-mdata(6,3)*eps^mdata(6,4));
Matdata.TEBX=mdata(7,1)-mdata(7,2)*exp(-mdata(7,3)*eps^mdata(7,4));
Matdata.TEBY=mdata(8,1)-mdata(8,2)*exp(-mdata(8,3)*eps^mdata(8,4));

Matdata.Txy15=mdata15(1)-mdata15(2)*exp(-mdata15(3)*eps^mdata15(4));
Matdata.Txy30=mdata30(1)-mdata30(2)*exp(-mdata30(3)*eps^mdata30(4));
Matdata.Txy60=mdata60(1)-mdata60(2)*exp(-mdata60(3)*eps^mdata60(4));
Matdata.Txy75=mdata75(1)-mdata75(2)*exp(-mdata75(3)*eps^mdata75(4));

Matdata.TPS00X=mdata(9,1)-mdata(9,2)*exp(-mdata(9,3)*eps^mdata(9,4));
Matdata.TPS00Y=mdata(10,1)-mdata(10,2)*exp(-mdata(10,3)*eps^mdata(10,4));

Matdata.TPS90X=mdata(11,1)-mdata(11,2)*exp(-mdata(11,3)*eps^mdata(11,4));
Matdata.TPS90Y=mdata(12,1)-mdata(12,2)*exp(-mdata(12,3)*eps^mdata(12,4));

Matdata.SS00=mdata(13,1)-mdata(13,2)*exp(-mdata(13,3)*eps^mdata(13,4));

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
Matdata.RT00=0.82;
Matdata.RT45=0.94 ;
Matdata.RT90=0.96;
Matdata.RC00=0.77;
Matdata.RC45=0.86;
Matdata.RC90=0.76 ;

end