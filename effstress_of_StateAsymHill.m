function [eff_sig] = effstress_of_StateAsymHill(Mdata,mdata,sig,type)

if type==1
    mu=0.5;
    ay=mdata.ay;
    by=mdata.by;
    cy=mdata.cy;
    dy=mdata.dy;
    ey=mdata.ey;
    fy=mdata.fy;
    gy=mdata.gy;
    effstress_aniso=ay*sig.xx+by*sig.yy+cy*sig.xy+sqrt(dy*sig.xx^2+ey*sig.yy^2-fy*sig.xx*sig.yy+gy*sig.xy^2);
    faeta(1)=mdata.a;
    faeta(2)=mdata.b;
    faeta(3)=mdata.c;
    faeta(4)=mdata.d;
    faeta(5)=mdata.e; %% eta^5 项没有
    faeta(6)=mdata.g;
    eta=(sig.xx+sig.yy)/(MisesPlaneStress(sig));
    sigvm=MisesPlaneStress(sig);
    f_eta=(faeta(1)+faeta(2)*eta+faeta(3)*eta^2+faeta(4)*eta^3+faeta(5)*eta^4+faeta(6)*eta^6)*sigvm;
else

%% 计算各项异性函数的参数
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

%% 计算 各向异性部分等效应力
effstress_aniso=ay*sig.xx+by*sig.yy+cy*sig.xy+sqrt(dy*sig.xx^2+ey*sig.yy^2-fy*sig.xx*sig.yy+gy*sig.xy^2);
%%
%% EBC UC SS UT PST EBT
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
eta=(sig.xx+sig.yy)/(MisesPlaneStress(sig));
sigvm=MisesPlaneStress(sig);
f_eta=(faeta(1)+faeta(2)*eta+faeta(3)*eta^2+faeta(4)*eta^3+faeta(5)*eta^4+faeta(6)*eta^6)*sigvm;

end
%%
eff_sig=f_eta*0.5+effstress_aniso*0.5;
end


function [effstress] = MisesPlaneStress(sig)
effstress=sqrt(sig.xx^2+sig.yy^2-sig.xx*sig.yy+3*sig.xy^2);
end
