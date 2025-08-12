function Plot3DPrincipal2()
clc
clear
close all

%1.2 1 0.8

MatData.sigT00=1;
MatData.sigUT=MatData.sigT00;
MatData.sigPST=MatData.sigT00/sqrt(3)*2;
MatData.sigPSC=MatData.sigT00/sqrt(3)*2;
MatData.sigBT=MatData.sigT00;
MatData.sigBC=MatData.sigT00;
MatData.sigUC=MatData.sigT00;
MatData.sigSS=MatData.sigT00/sqrt(3);

mdata.c=0.0;
[plotData1_sx,plotData1_sy,plotData3] = DataPrincpile_generate(mdata,MatData);

figure(1)
plot(plotData1_sx,plotData1_sy,'linewidth',1,'color','b');
hold on 
dotcolor=[0 0 0];
plot3(MatData.sigT00,0,0,'.','color',dotcolor,'markersize',17)
% plot3(-MatData.sigUC,0,0,'.','color',dotcolor,'markersize',20)
plot3(0,-MatData.sigUC,0,'.','color',dotcolor,'markersize',17)
plot3(MatData.sigPST,MatData.sigPST/2,0,'.','color',dotcolor,'markersize',17)
plot3(MatData.sigSS,-MatData.sigSS,0,'.','color',dotcolor,'markersize',17)
plot3(MatData.sigBT,MatData.sigBT,0,'.','color',dotcolor,'markersize',17)
plot3(-MatData.sigBC,-MatData.sigBC,0,'.','color',dotcolor,'markersize',17)
axis equal
xlabel('\sigma_{xx}','FontSize',16,'FontName','Times New Roman')
ylabel('\sigma_{yy}','FontSize',16,'FontName','Times New Roman')


figure(4)
axes1 = axes('Parent',figure(4));
s2=surf(plotData3.S1,plotData3.S2,plotData3.S3,'FaceColor', 'g','EdgeColor', 'none','FaceAlpha',0.8);
hold on 
szTemp=zeros(length(plotData1_sy),1);
plot3(plotData1_sx,plotData1_sy,szTemp,'linewidth',1.5,'color','r');
dotcolor=[0 0 0];
plot3(MatData.sigT00,0,0,'.','color',dotcolor,'markersize',17)
% plot3(-MatData.sigUC,0,0,'.','color',dotcolor,'markersize',20)
plot3(0,-MatData.sigUC,0,'.','color',dotcolor,'markersize',17)
plot3(MatData.sigPST,MatData.sigPST/2,0,'.','color',dotcolor,'markersize',17)
plot3(MatData.sigSS,-MatData.sigSS,0,'.','color',dotcolor,'markersize',17)
plot3(MatData.sigBT,MatData.sigBT,0,'.','color',dotcolor,'markersize',17)
plot3(-MatData.sigBC,-MatData.sigBC,0,'.','color',dotcolor,'markersize',17)

% 定义平面方程：2x + 3y - z = 5
[x, y] = meshgrid(-2:0.5:2);
z = zeros(size(x));
surf(x, y, z, 'FaceColor', 'k','EdgeColor', 'none', 'FaceAlpha', 0.4);
[x, z] = meshgrid(-2:0.5:2);
y = zeros(size(x));
surf(x, y, z, 'FaceColor', 'b','EdgeColor', 'none', 'FaceAlpha', 0.4);
[y, z] = meshgrid(-2:0.5:2);
x= zeros(size(z));
surf(x, y, z, 'FaceColor', 'm','EdgeColor', 'none', 'FaceAlpha', 0.4);



axis equal
% hold off
xlabel('{\sigma}_{1}','FontSize',16,'FontName','Times New Roman')
ylabel('{\sigma}_{2}','FontSize',16,'FontName','Times New Roman')
zlabel('{\sigma}_{3}','FontSize',16,'FontName','Times New Roman')
set(axes1,'DataAspectRatio',[1 1 1],'XTick',[-2 -1.5 -1 -0.5 0 0.5 1 1.5 2],...
    'YTick',[-2 -1.5 -1 -0.5 0 0.5 1 1.5 2],'ZTick',...
    [-2 -1.5 -1 -0.5 0 0.5 1 1.5 2]);
set(gcf, 'Color', 'white');
% 绘制非线性第一应力不变量


seta=[-2  -1  0 1  sqrt(3)  2 ];
Mf=[1 seta(1) seta(1)^2 seta(1)^3 seta(1)^4 seta(1)^6;
    1 seta(2) seta(2)^2 seta(2)^3 seta(2)^4 seta(2)^6;
    1 seta(3) seta(3)^2 seta(3)^3 seta(3)^4 seta(3)^6;
    1 seta(4) seta(4)^2 seta(4)^3 seta(4)^4 seta(4)^6;
    1 seta(5) seta(5)^2 seta(5)^3 seta(5)^4 seta(5)^6;
    1 seta(6) seta(6)^2 seta(6)^3 seta(6)^4 seta(6)^6];
sigref=MatData.sigT00;
sigUT=MatData.sigUT;
sigPST=MatData.sigPST;
sigBT=MatData.sigBT;
sigBC=MatData.sigBC;
sigUC=MatData.sigUC;
sigSS=MatData.sigSS;
rightTemp(1)=sigref/sigBC;
rightTemp(2)=sigref/sigUC;
rightTemp(3)=sigref/(sigSS*sqrt(3));
rightTemp(4)=sigref/(sigUT);
rightTemp(5)=sigref/(sigPST*sqrt(3)/2);
rightTemp(6)=sigref/(sigBT);
faeta=Mf\rightTemp';

etab=-2:0.01:2;
for i=1:length(etab)
    f_eta(i)=faeta(1)+faeta(2)*etab(i)+faeta(3)*etab(i)^2+faeta(4)*etab(i)^3+faeta(5)*etab(i)^4+faeta(6)*etab(i)^6;
end

figure(6)
axes2 = axes('Parent',figure(6));
plot(etab,f_eta,"b","linewidth",1.2);
hold on
plot(-2,sigref/sigBC,'.','color','k','markersize',15);
plot(-1,sigref/sigUC,'.','color','k','markersize',15);
plot(0,sigref/(sigSS*sqrt(3)),'.','color','k','markersize',15);
plot(1,sigref/sigUT,'.','color','k','markersize',15);
plot(sqrt(3),sigref/(sigPST*sqrt(3)/2),'.','color','k','markersize',15);
plot(2,sigref/(sigBT),'.','color','k','markersize',15);

box(axes2,'on');
ylim([0.5,1.5])
set(axes2,'FontSize',12,'XTick',[-2 -1.5 -1 -0.5 0 0.5 1 1.5 2],'YTick', [0.5 0.7 0.9 1.1 1.3 1.5]);
xlabel('$\overline{\eta}_{3D}$', 'Interpreter', 'latex','FontSize',16,'FontName','Times New Roman')
ylabel('$f(\overline{\eta}_{3D})$', 'Interpreter', 'latex','FontSize',16,'FontName','Times New Roman')





end




function [plotData1_sx,plotData1_sy,plotData3] = DataPrincpile_generate(mdata,matdata)
% mdata 模型参数
% matdata 材料参数

yieldFunctionType=1;
%%  平面应力二维图 ：sigma_xx-sigma_yy
% 
poleAngle=0:0.01:360;
plotData1_sx=[];
plotData1_sy=[];
for i=1:length(poleAngle)
    angle=poleAngle(i)*pi/180;
    sig.xx=cos(angle);
    sig.yy=sin(angle);
    sig.xy=0;
 
    dnom=effect_stress(matdata,mdata,sig,matdata.sigT00,yieldFunctionType);
    xnom=matdata.sigT00/dnom;
    plotData1_sx(i)=sig.xx*xnom;
    plotData1_sy(i)=sig.yy*xnom;
end



%% 平面应力三维图 ：sigma_xx-sigma_xy-sigma_zz
sigpi=zeros(3,1);
plotData3.S1=[];
plotData3.S2=[];
plotData3.S3=[];
ifa=1:1.5:363;
bet=-58:4:58;
sig_ref=matdata.sigT00;
for is=1:length(ifa)
    for js=1:length(bet)
        alp=ifa(is)/180*pi;
        bta=bet(js)/180*pi;
        sigpi(1)=cos(bta)*cos(alp);
        sigpi(2)=cos(bta)*sin(alp);
        sigpi(3)=sin(bta);
        
        % 由pi平面坐标转换到主坐标
        trnsm=[sqrt(2)/2 0 -sqrt(2)/2; -1/sqrt(6) sqrt(6)/3 -1/sqrt(6); sqrt(3)/3 sqrt(3)/3 sqrt(3)/3];
        
        sigmain=trnsm\sigpi;
        sig.xx=sigmain(1);
        sig.yy=sigmain(2);
        sig.zz=sigmain(3);
        
        sig.xy=0;
        sig.yz=0;
        sig.xz=0;
        
        fy_try=effect_stress3D(matdata,mdata,sig,matdata.sigT00,yieldFunctionType);
        sig_ref=matdata.sigT00;
        r_radus=sig_ref/fy_try;
        plotData3.S1(is,js)=r_radus*sig.xx;
        plotData3.S2(is,js)=r_radus*sig.yy;
        plotData3.S3(is,js)=r_radus*sig.zz;
    end
end

end

%% 求不同屈服函数的应力
function [sig_bar] = effect_stress(matdata,mdata,sig,sigT00,yieldType)

sig_bar=effstress_of_StateMises(matdata,mdata,sig);

end


function [sig_bar] = effect_stress3D(matdata,mdata,sig,sigT00,yieldType)
    [sig_bar] = effstress_of_StateMises3D(matdata,mdata,sig);
end


