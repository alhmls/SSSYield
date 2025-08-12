function [rhs ] = RHS_Hou2023_for_QP1180(Hou2023data)

mdata.hy1=Hou2023data(1);
mdata.hy2=Hou2023data(2);
mdata.ay=Hou2023data(3);
mdata.by=Hou2023data(4);
mdata.cy=Hou2023data(5);
mdata.dy=Hou2023data(6);
mdata.ey=Hou2023data(7);
% mdata.rhoy=Hou2023data(8);
mdata.rhoy=1.5;

[Mdata_QP1180] =  give_matdata_QP1180(0.002);

matdata=Mdata_QP1180;
yieldFunctionType=0;
sigT00=matdata.sigT00;
sigT45=matdata.sigT45;
sigT90=matdata.sigT90*1.0 ;
sigTb=matdata.sigBT;
sigC00=matdata.sigC00;
sigC45=matdata.sigC45;
sigC90=matdata.sigC90;
sigref=matdata.sigT00;
sigUT=matdata.sigUT;
sigPST=matdata.sigPST;
sigBT=matdata.sigBT;
sigBC=matdata.sigBC;
sigUC=matdata.sigUC;
sigSS=matdata.sigSS;

sig.xx=1;
sig.yy=0;
sig.xy=0;
sigT00_pre=cal_sigUT_effect_stress(0.0,matdata,mdata,sig,matdata.sigT00,yieldFunctionType);
sigT45_pre=cal_sigUT_effect_stress(45,matdata,mdata,sig,matdata.sigT00,yieldFunctionType);
sigT90_pre=cal_sigUT_effect_stress(90,matdata,mdata,sig,matdata.sigT00,yieldFunctionType);

sigC00_pre=cal_sigUC_effect_stress(0.0,matdata,mdata,sig,matdata.sigT00,yieldFunctionType);
sigC45_pre=cal_sigUC_effect_stress(45,matdata,mdata,sig,matdata.sigT00,yieldFunctionType);
sigC90_pre=cal_sigUC_effect_stress(90,matdata,mdata,sig,matdata.sigT00,yieldFunctionType);

%% sigBT:
sig.xx=1;
sig.yy=1;
sig.xy=0;
dnom=effect_stress(matdata,mdata,sig,matdata.sigT00,yieldFunctionType);
sigBT_pre=matdata.sigT00/dnom;

%% sigPST:
sig.xx=1;
sig.yy=0.5;
sig.xy=0;
dnom=effect_stress(matdata,mdata,sig,matdata.sigT00,yieldFunctionType);
sigPST_pre=matdata.sigT00/dnom;

%% sigSS:
sig.xx=1;
sig.yy=-1;
sig.xy=0;
dnom=effect_stress(matdata,mdata,sig,matdata.sigT00,yieldFunctionType);
sigSS_pre=matdata.sigT00/dnom;


rhs=(1-sigT00_pre/sigT00)^2+(1-sigT45_pre/sigT45)^2+(1-sigT90_pre/sigT90)^2+...
    (1-sigC00_pre/sigC00)^2+(1-sigC90_pre/sigC90)^2+...
    (1-sigBT_pre/sigBT)^2+(1-sigPST_pre/sigPST)^2+(1-sigSS_pre/sigSS)^2;

rhs=(1-sigT00_pre/sigT00)^2+(1-sigT45_pre/sigT45)^2+(1-sigT90_pre/sigT90)^2+...
    (1-sigC00_pre/sigC00)^2+(1-sigC90_pre/sigC90)^2+...
    (1-sigBT_pre/sigBT)^2 +(1-sigSS_pre/sigSS)^2+(1-sigPST_pre/sigPST)^2;

end

function sigu=cal_sigUC_effect_stress(theta,matdata,mdata,sig,sigT00,yieldType)
the=theta*pi/180;
sig.xx=-cos(the)*cos(the);
sig.yy=-sin(the)*sin(the);
sig.xy=-sin(the)*cos(the);
dnom=effect_stress(matdata,mdata,sig,sigT00,yieldType);
sigu=matdata.Txy00/dnom;

end

function sigu=cal_sigUT_effect_stress(theta,matdata,mdata,sig,sigT00,yieldType)
the=theta*pi/180;
sig.xx=cos(the)*cos(the);
sig.yy=sin(the)*sin(the);
sig.xy=sin(the)*cos(the);
dnom=effect_stress(matdata,mdata,sig,sigT00,yieldType);
sigu=matdata.Txy00/dnom;

end

%% 求不同屈服函数的应力
function [sig_bar] = effect_stress(matdata,mdata,sig,sigT00,yieldType)

    sig_bar=effstress_of_Hou2023(matdata,mdata,sig,0);


end
