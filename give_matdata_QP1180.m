function Matdata=give_matdata_QP1180(eps)
%  Characterization and modelling of evolving plasticity behaviour 
%   up to fracture for FCC and BCC metals 

mdata=[2145  0.0283  0.223  1544 972 11.23 0.1;
    2067  0.0288  0.212  1514 976 11.19  0.1;
    2099  0.0288  0.214  1522 986 11.54   0.1;
    1424  0.0011  0.045 1252 1080 56.6  1.6;
    1449  0.0024  0.053  1256 1077 46.8 1.6;
    1471  0.0024  0.051  1276 1099 50.7 1.6];


mdata2=...
    [1529  1020  4.58  0.69 0   ;
    1488  1034  8.19  0.86 0    ;
    1496  1050  7.05  0.82 0  ;
    1500  948  15.6  1.09 0  ;
    1498  955  15.5  1.08 0    ;
    1510  975  15.3  1.09 0    ;
    1369  1059  57.7  1.33 542.5   ;
    1325 1191 112.3  1.29 336.3 ];


Matdata.rT00=0.86;
Matdata.rT45=0.94;
Matdata.rT90=0.92;

RT00=Matdata.rT00;
RT45=Matdata.rT45;
RT90=Matdata.rT90;
 Tlam=(1+1/RT90)/(1+1/RT00);
 Tnu=(1)/(1+1/RT00);
 
 Trho=(2*RT45+1)*(1/RT00+1/RT90)/(2*(1+1/RT00));
 
%  efsigT=sqrt(sig.xx^2+Tlam*sig.yy^2-2*Tnu*sig.xx*sig.yy+2*Trho*sig.xy^2);



Matdata.Txy00=(mdata(1,1)*(eps+mdata(1,2))^mdata(1,3))*mdata(1,7) + (mdata(1,4)-(mdata(1,4)-mdata(1,5))*exp(-mdata(1,6)*eps))*(1-mdata(1,7)) ;
Matdata.Txy45=(mdata(2,1)*(eps+mdata(2,2))^mdata(2,3))*mdata(2,7) + (mdata(2,4)-(mdata(2,4)-mdata(2,5))*exp(-mdata(2,6)*eps))*(1-mdata(2,7)) ;
Matdata.Txy90=(mdata(3,1)*(eps+mdata(3,2))^mdata(3,3))*mdata(3,7) + (mdata(3,4)-(mdata(3,4)-mdata(3,5))*exp(-mdata(3,6)*eps))*(1-mdata(3,7)) ;
Matdata.Cxy00=(mdata(4,1)*(eps+mdata(4,2))^mdata(4,3))*mdata(4,7) + (mdata(4,4)-(mdata(4,4)-mdata(4,5))*exp(-mdata(4,6)*eps))*(1-mdata(4,7)) ;
Matdata.Cxy45=(mdata(5,1)*(eps+mdata(5,2))^mdata(5,3))*mdata(5,7) + (mdata(5,4)-(mdata(5,4)-mdata(5,5))*exp(-mdata(5,6)*eps))*(1-mdata(5,7)) ;
Matdata.Cxy90=(mdata(6,1)*(eps+mdata(6,2))^mdata(6,3))*mdata(6,7) + (mdata(6,4)-(mdata(6,4)-mdata(6,5))*exp(-mdata(6,6)*eps))*(1-mdata(6,7)) ;

Matdata.SS00=(mdata2(1,1)-(mdata2(1,1)-mdata2(1,2))*exp(-mdata2(1,3)*eps^mdata2(1,4))+mdata2(1,5)*eps)/sqrt(3);
Matdata.SS45=(mdata2(2,1)-(mdata2(2,1)-mdata2(2,2))*exp(-mdata2(2,3)*eps^mdata2(2,4))+mdata2(2,5)*eps)/sqrt(3);
Matdata.SS90=(mdata2(3,1)-(mdata2(3,1)-mdata2(3,2))*exp(-mdata2(3,3)*eps^mdata2(3,4))+mdata2(3,5)*eps)/sqrt(3);
Matdata.TPS00=(mdata2(4,1)-(mdata2(4,1)-mdata2(4,2))*exp(-mdata2(4,3)*eps^mdata2(4,4))+mdata2(4,5)*eps)/(sqrt(3)/2);
Matdata.TPS45=(mdata2(5,1)-(mdata2(5,1)-mdata2(5,2))*exp(-mdata2(5,3)*eps^mdata2(5,4))+mdata2(5,5)*eps)/(sqrt(3)/2);
Matdata.TPS90=(mdata2(6,1)-(mdata2(6,1)-mdata2(6,2))*exp(-mdata2(6,3)*eps^mdata2(6,4))+mdata2(6,5)*eps)/(sqrt(3)/2);
Matdata.TEB=mdata2(7,1)-(mdata2(7,1)-mdata2(7,2))*exp(-mdata2(7,3)*eps^mdata2(7,4))+mdata2(7,5)*eps;
Matdata.CEB=mdata2(8,1)-(mdata2(8,1)-mdata2(8,2))*exp(-mdata2(8,3)*eps^mdata2(8,4))+mdata2(8,5)*eps;








Matdata.sigT00=Matdata.Txy00;

Matdata.sigT45=Matdata.Txy45;

Matdata.sigT90=Matdata.Txy90;


Matdata.sigC00=Matdata.Cxy00;
Matdata.sigC45=Matdata.Cxy45;
Matdata.sigC90=Matdata.Cxy90;


Matdata.sigBT= Matdata.TEB;


Matdata.sigBC=Matdata.CEB;
Matdata.sigUT=Matdata.sigT00;
Matdata.sigPST=Matdata.TPS00;

Matdata.sigUC=Matdata.sigC90 ;
Matdata.sigBT=Matdata.TEB;
Matdata.sigSS=Matdata.SS45;









end