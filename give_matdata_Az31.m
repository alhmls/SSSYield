function [Mdata] = give_matdata_Az31(eps)
Mdata.sigT00=215;
Mdata.sigT45=219;
Mdata.sigT90=223;
Mdata.sigBT=221.0;
Mdata.sigPS=104.5;
Mdata.sigC00=147.0;
Mdata.sigC90=146.0;

Mdata.sigC45=146.499;



Mdata.sigUT=Mdata.sigT00;
Mdata.sigPST=2.50639853747715e+002;
Mdata.sigPST=250.640;
Mdata.sigPSC=Mdata.sigC90*Mdata.sigPST/Mdata.sigT00*0.92;
Mdata.sigUC=Mdata.sigC90;
Mdata.sigBC=(Mdata.sigC00+Mdata.sigC90+2*Mdata.sigC45)/4;
Mdata.sigSS=Mdata.sigPS;

Mdata.Txy00=Mdata.sigT00;
Mdata.Txy45=Mdata.sigT45;  
Mdata.Txy90=Mdata.sigT90;
Mdata.Cxy00=Mdata.sigC00;
Mdata.Cxy45=Mdata.sigC45;
Mdata.Cxy90=Mdata.sigC90;

Mdata.other=1;
Mdata.other1.xx=2.32541133455210e+002;
Mdata.other1.xx=232.541;
Mdata.other1.yy=5.87015329125338e+001;
Mdata.other1.yy=58.702;

Mdata.other2.xx=2.46252285191956e+002;
Mdata.other2.xx=246.25;
Mdata.other2.yy=1.84761045987376e+002;
Mdata.other2.yy=184.76;


Mdata.other3.xx=61.1814;
Mdata.other3.yy=246.0542;

Mdata.other4.xx=126.9349;
Mdata.other4.yy=254.3690;

Mdata.other5.xx=179.5086 ;
Mdata.other5.yy=239.2979;





end
