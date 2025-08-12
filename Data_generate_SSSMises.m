function [plotData1_sx,plotData1_sy,plotData2_sx,plotData2_sy,plotData3,plotData4] = Data_generate_SSSMises(mdata,matdata,yieldFunctionType)
% mdata 模型参数
% matdata 材料参数

%%  平面应力二维图 ：sigma_xx-sigma_yy
% 
if(yieldFunctionType<0)
    poleAngle=0:5:360;
    matdata.sigT00=1;
else
    poleAngle=0:0.1:360;
end
plotData1_sx=[];
plotData1_sy=[];
for i=1:length(poleAngle)
    angle=poleAngle(i)*pi/180;
    sig.xx=cos(angle);
    sig.yy=sin(angle);
    sig.xy=0;
%     dnom=effstress_of_StateMises(matdata,mdata,sig);
%     dnom=effstress_of_StateAsymHill(matdata,mdata,sig,0);
    dnom=effect_stress(matdata,mdata,sig,matdata.sigT00,yieldFunctionType);
    xnom=matdata.sigT00/dnom;
    plotData1_sx(i)=sig.xx*xnom;
    plotData1_sy(i)=sig.yy*xnom;
end




%% 平面应力二维图 ：sigma_xx-sigma_xy
poleAngle=0:0.1:360;
plotData2_sx=[];
plotData2_sy=[];
for i=1:length(poleAngle)
    angle=poleAngle(i)*pi/180;
    sig.xx=cos(angle);
    sig.yy=cos(angle);
    sig.xy=sin(angle);
%     dnom=effstress_of_StateMises(matdata,mdata,sig);
    dnom=effect_stress(matdata,mdata,sig,matdata.sigT00,yieldFunctionType);
    xnom=matdata.sigT00/dnom;
    plotData2_sx(i)=sig.xx*xnom;
    plotData2_sy(i)=sig.xy*xnom;
end



%% 平面应力三维图 ：sigma_xx-sigma_xy-sigma_zz

plotData3.Sxx=[];
plotData3.Syy=[];
plotData3.Sxy=[];
ifa=1:3:363;
bet=-90:3:90;
sig_ref=matdata.sigT00;
for is=1:length(ifa)
    for js=1:length(bet)
        alp=ifa(is)/180*pi;
        bta=bet(js)/180*pi;
        sig.xx=cos(bta)*cos(alp);
        sig.yy=cos(bta)*sin(alp);
        sig.xy=sin(bta);
        fy_try=effect_stress(matdata,mdata,sig,matdata.sigT00,yieldFunctionType);
        sig_ref=matdata.sigT00;
        r_radus=sig_ref/fy_try;
        plotData3.Sxx(is,js)=r_radus*cos(bta)*cos(alp);
        plotData3.Syy(is,js)=r_radus*cos(bta)*sin(alp);
        plotData3.Sxy(is,js)=r_radus*sin(bta);
    end
end
plotData3.utsigxx=[];
plotData3.utsigyy=[];
plotData3.utsigxy=[];
% 单轴拉伸曲线：
theta=0:0.01:180;
for is=1:length(theta)
    the=theta(is)*pi/180;
    sig.xx=cos(the)*cos(the);
    sig.yy=sin(the)*sin(the);
    sig.xy=cos(the)*sin(the);
    [fy_try] = effect_stress(matdata,mdata,sig,matdata.sigT00,yieldFunctionType);
    r_radus=sig_ref/fy_try;
    plotData3.utsigxx(is)=r_radus*cos(the)*cos(the);
    plotData3.utsigyy(is)=r_radus*sin(the)*sin(the);
    plotData3.utsigxy(is)=r_radus*cos(the)*sin(the);
end

% 单轴压缩曲线：
plotData3.ucsigxx=[];
plotData3.ucsigyy=[];
plotData3.ucsigxy=[];
for is=1:length(theta)
    the=theta(is)*pi/180;
    sig.xx =-cos(the)*cos(the);
    sig.yy =-sin(the)*sin(the);
    sig.xy =-cos(the)*sin(the);
    [fy_try] = effect_stress(matdata,mdata,sig,matdata.sigT00,yieldFunctionType);
    r_radus=sig_ref/fy_try;
    plotData3.ucsigxx(is)=-r_radus*cos(the)*cos(the);
    plotData3.ucsigyy(is)=-r_radus*sin(the)*sin(the);
    plotData3.ucsigxy(is)=-r_radus*cos(the)*sin(the);
end

% 法平面：
plotData3.nmsigxx=[];
plotData3.nmsigyy=[];
plotData3.nmsigxy=[];
poleAngle=0:0.1:360;
for i=1:length(poleAngle)
    angle=poleAngle(i)*pi/180;
    sig.xx=cos(angle);
    sig.yy=sin(angle);
    sig.xy=0;
%     dnom=effstress_of_StateMises(matdata,mdata,sig);
%     dnom=effstress_of_StateAsymHill(matdata,mdata,sig,0);
    dnom=effect_stress(matdata,mdata,sig,matdata.sigT00,yieldFunctionType);
    xnom=matdata.sigT00/dnom;
    plotData3.nmsigxx(i)=sig.xx*xnom;
    plotData3.nmsigyy(i)=sig.yy*xnom;
    plotData3.nmsigxy(i)=0.0;
end

% 对角平面：

poleAngle=0:0.1:360;
plotData3.dmsigxx=[];
plotData3.dmsigyy=[];
plotData3.dmsigxy=[];
for i=1:length(poleAngle)
    angle=poleAngle(i)*pi/180;
    sig.xx=cos(angle);
    sig.yy=cos(angle);
    sig.xy=sin(angle);
%     dnom=effstress_of_StateMises(matdata,mdata,sig);
    dnom=effect_stress(matdata,mdata,sig,matdata.sigT00,yieldFunctionType);
    xnom=matdata.sigT00/dnom;
    plotData3.dmsigxx(i)=sig.xx*xnom;
    plotData3.dmsigyy(i)=sig.yy*xnom;
    plotData3.dmsigxy(i)=sig.xy*xnom;
end

%% 单轴拉伸/压缩 角度曲线

Theta=0:0.1:90;
plotData4.sbxyT=Theta;
plotData4.sbxyC=Theta;
for i=1:length(Theta)
    theta=Theta(i);
    plotData4.sbxyT(i)=cal_sigUT_effect_stress(theta,matdata,mdata,sig,matdata.sigT00,yieldFunctionType);
    plotData4.sbxyC(i)=cal_sigUC_effect_stress(theta,matdata,mdata,sig,matdata.sigT00,yieldFunctionType);
end

plotData4.Theta=Theta;




end

%% 求不同角度的单轴 应力

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

if yieldType==1
    sig_bar=effstress_of_StateMises(matdata,mdata,sig);
elseif  yieldType==2
    sig_bar=effstress_of_StateMises2(matdata,mdata,sig);
elseif yieldType==3
    sig_bar=effstress_of_StateMises3(matdata,mdata,sig);
elseif yieldType==4
    sig_bar=effstress_of_StateMises4(matdata,mdata,sig);
elseif yieldType==5
    sig_bar=effstress_of_StateMises5(matdata,mdata,sig);
elseif yieldType==-0
       sig_bar=effstress_of_StateMises0(matdata,mdata,sig); 
end
end





