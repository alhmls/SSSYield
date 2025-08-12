function [mdata] = call_factor_of_StateAsymHill(Mdata)

sigT00=Mdata.sigT00;
sigT45=Mdata.sigT45;
sigT90=Mdata.sigT90;
sigTb=Mdata.sigBT;
sigC00=Mdata.sigC00;
sigC45=Mdata.sigC45;
sigC90=Mdata.sigC90;
mu=0.5;
ay=0.5*(1-(sigT00-mu*sigC00)/((1-mu)*sigC00));
by=0.5*((sigT00-mu*sigT90)/((1-mu)*sigT90)-(sigT00-mu*sigC90)/((1-mu)*sigC90));
cy=((sigT00-mu*sigT45)/((1-mu)*sigT45)-(sigT00-mu*sigC45)/((1-mu)*sigC45))-ay-by;
dy=0.25*(1+(sigT00-mu*sigC00)/((1-mu)*sigC00))^2;
ey=0.25*((sigT00-mu*sigT90)/((1-mu)*sigT90)+(sigT00-mu*sigC90)/((1-mu)*sigC90))^2;
fy=dy+ey-((sigT00-mu*sigTb)/((1-mu)*sigTb)-ay-by)^2;
gy=((sigT00-mu*sigT45)/((1-mu)*sigT45)+(sigT00-mu*sigC45)/((1-mu)*sigC45))^2-((sigT00-mu*sigTb)/((1-mu)*sigTb)- ay- by)^2;

seta=[-2  -1  0 1  sqrt(3)  2 ];
Mf=[1 seta(1) seta(1)^2 seta(1)^3 seta(1)^4 seta(1)^6;
    1 seta(2) seta(2)^2 seta(2)^3 seta(2)^4 seta(2)^6;
    1 seta(3) seta(3)^2 seta(3)^3 seta(3)^4 seta(3)^6;
    1 seta(4) seta(4)^2 seta(4)^3 seta(4)^4 seta(4)^6;
    1 seta(5) seta(5)^2 seta(5)^3 seta(5)^4 seta(5)^6;
    1 seta(6) seta(6)^2 seta(6)^3 seta(6)^4 seta(6)^6];
sigref=Mdata.sigT00;
sigUT=Mdata.sigUT;
sigPST=Mdata.sigPST;
sigBT=Mdata.sigBT;
sigBC=Mdata.sigBC;
sigUC=Mdata.sigUC;
sigSS=Mdata.sigSS;
rightTemp(1)=(sigref-(sigBC*(-ay-by+sqrt(dy+ey-fy)))*(1-mu))/mu/sigBC;
rightTemp(2)=1.0;%sigref/sigUC;
rightTemp(3)=(sigref-(sigSS*(ay-by+sqrt(dy+ey+fy)))*(1-mu))/(mu*sqrt(3)*sigSS);
rightTemp(4)=1.0;%sigref/(sigUT);
rightTemp(5)=(sigref-(sigPST*(ay+0.5*by+sqrt(dy+ey*0.25-0.5*fy)))*(1-mu))/(mu*sqrt(3)*sigPST/2);
rightTemp(6)=1.0;%sigref/(sigBT);
faeta=Mf\rightTemp';

mdata.ay=ay;
mdata.by=by;
mdata.cy=cy;
mdata.dy=dy;
mdata.ey=ey;
mdata.fy=fy;
mdata.gy=gy;
	
mdata.a=faeta(1);
mdata.b=faeta(2);
mdata.c=faeta(3);
mdata.d=faeta(4);
mdata.e=faeta(5); 
mdata.g=faeta(6); 

end