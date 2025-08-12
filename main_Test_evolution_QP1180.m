clear;clc;
close all
%% 首先计算满足凸性的等效塑性应变区间
isrev=0;
tol=1e-4;
a0=0.0;
b0=0.3;     % 在【0，0.3】之间检测

% [a1,b1] = Convex_regin_StateYieldFunction_for_QP1180(a0,b0,tol,isrev);

%% 绘制法平面演化图像
a1=0;
b1=0.3;
epsm=linspace(a1, b1, 10);
figure(1)
for i=1:length(epsm)
    eps=epsm(i);
    MatData =give_matdata_QP1180(eps);
    mdata.c=0;%% 只用于输入
    [plotData1_sx,plotData1_sy,plotData2_sx,plotData2_sy,plotData3,plotData4] = Data_generate_stateAsymHill(mdata,MatData);
    if(i==1)
        plot(plotData1_sx,plotData1_sy,'r');
    else
        plot(plotData1_sx,plotData1_sy,'r','HandleVisibility', 'off');
    end
    hold on;
    if(i==1)
        plot(MatData.Txy00,0,'.','color','k','markersize',10)
        plot(MatData.TPS90/2,MatData.TPS90,'s','MarkerFaceColor','b','MarkerEdgeColor','b','markersize',4);
    else
        plot(MatData.Txy00,0,'.','color','k','markersize',10,'HandleVisibility', 'off');
        plot(MatData.TPS90/2,MatData.TPS90,'s','MarkerFaceColor','b','MarkerEdgeColor','b','markersize',4,'HandleVisibility', 'off');
    end
    plot(0,MatData.Txy90,'.','color','k','markersize',10,'HandleVisibility', 'off')
    plot(-MatData.Cxy00,0,'.','color','k','markersize',10,'HandleVisibility', 'off')
    plot(0,-MatData.sigUC,'.','color','k','markersize',10,'HandleVisibility', 'off')
    plot(MatData.sigPST,MatData.sigPST/2,'.','color','k','markersize',10,'HandleVisibility', 'off')
    plot(MatData.sigSS,-MatData.sigSS,'.','color','k','markersize',10,'HandleVisibility', 'off')
    % plot(-matdata.sigPSC/2,-matdata.sigPSC,'.','color','k','markersize',15)
    plot(MatData.sigBT,MatData.sigBT,'.','color','k','markersize',10,'HandleVisibility', 'off')
    plot(-MatData.sigBC,-MatData.sigBC,'.','color','k','markersize',10,'HandleVisibility', 'off')
    
    
    
    
end
set(gca, 'FontSize', 12,'FontName','Times New Roman');
xlabel('\sigma_{xx}(Mpa)', 'Interpreter', 'tex','FontSize',14,'FontName','Times New Roman')
ylabel('\sigma_{yy}(Mpa)', 'Interpreter', 'tex','FontSize',14,'FontName','Times New Roman')
legend1 =legend('Prop.','Exp. (Input)','Exp. ');
set(legend1,'FontSize',12,'Box','off','FontName','Times New Roman')
hold off
axis equal



figure(2)
for i=1:length(epsm)
    eps=epsm(i);
    MatData =give_matdata_QP1180(eps);
    mdata.c=0;%% 只用于输入
    [plotData1_sx,plotData1_sy,plotData2_sx,plotData2_sy,plotData3,plotData4] = Data_generate_stateAsymHill(mdata,MatData);
    for is=1:length(plotData1_sx)
        lams(is)=eps;
    end
    if(i==1)
        plot3(plotData1_sx,plotData1_sy,lams,'color','r','linewidth',1.5);
    else
        plot3(plotData1_sx,plotData1_sy,lams,'color','r','linewidth',1.5,'HandleVisibility', 'off');
    end
    hold on;
    if(i==1)
        plot3(MatData.Txy00,0,eps,'.','color','k','markersize',15)
        plot3(MatData.TPS90/2,MatData.TPS90,eps,'s','MarkerFaceColor','b','MarkerEdgeColor','b','markersize',6);
    else
        plot3(MatData.Txy00,0,eps,'.','color','k','markersize',15,'HandleVisibility', 'off');
        plot3(MatData.TPS90/2,MatData.TPS90,eps,'s','MarkerFaceColor','b','MarkerEdgeColor','b','markersize',6,'HandleVisibility', 'off');
    end
    plot3(0,MatData.Txy90,eps,'.','color','k','markersize',15,'HandleVisibility', 'off')
    plot3(-MatData.Cxy00,0,eps,'.','color','k','markersize',15,'HandleVisibility', 'off')
    plot3(0,-MatData.sigUC,eps,'.','color','k','markersize',15,'HandleVisibility', 'off')
    plot3(MatData.sigPST,MatData.sigPST/2,eps,'.','color','k','markersize',15,'HandleVisibility', 'off')
    plot3(MatData.sigSS,-MatData.sigSS,eps,'.','color','k','markersize',15,'HandleVisibility', 'off')
    % plot(-matdata.sigPSC/2,-matdata.sigPSC,'.','color','k','markersize',15)
    plot3(MatData.sigBT,MatData.sigBT,eps,'.','color','k','markersize',15,'HandleVisibility', 'off')
    plot3(-MatData.sigBC,-MatData.sigBC,eps,'.','color','k','markersize',15,'HandleVisibility', 'off')
    
    
    
    
end
set(gca, 'FontSize', 12,'FontName','Times New Roman');
xlabel('\sigma_{xx}(Mpa)', 'Interpreter', 'tex','FontSize',14,'FontName','Times New Roman')
ylabel('\sigma_{yy}(Mpa)', 'Interpreter', 'tex','FontSize',14,'FontName','Times New Roman')
zlabel('Effective plastic strain', 'Interpreter', 'tex','FontSize',14,'FontName','Times New Roman')
legend1 =legend('Prop.','Exp. (Input)','Exp. ');
set(legend1,'FontSize',12,'Box','off','FontName','Times New Roman')
hold off





%% 绘制对角平面演化图像
figure(3)
for i=1:length(epsm)
    eps=epsm(i);
    MatData =give_matdata_QP1180(eps);
    mdata.c=0;%% 只用于输入
    [plotData1_sx,plotData1_sy,plotData2_sx,plotData2_sy,plotData3,plotData4] = Data_generate_stateAsymHill(mdata,MatData);
    if(i==1)
        plot(plotData2_sx,plotData2_sy,'r');
    else
        plot(plotData2_sx,plotData2_sy,'r','HandleVisibility', 'off');
    end
    hold on;
    if(i==1)
        plot(MatData.sigBT,0,'.','color','k','markersize',10)
        plot(0.0,MatData.SS00,'s','MarkerFaceColor','b','MarkerEdgeColor','b','markersize',4);
    else
        plot(MatData.sigBT,0,'.','color','k','markersize',10,'HandleVisibility', 'off')
        plot(0.0,MatData.SS00,'s','MarkerFaceColor','b','MarkerEdgeColor','b','markersize',4,'HandleVisibility', 'off');
    end
 
    plot(-MatData.sigBC,0,'.','color','k','markersize',10,'HandleVisibility', 'off')

    plot(MatData.sigBT,0,'.','color','k','markersize',10,'HandleVisibility', 'off')
    plot(MatData.sigT45/2,MatData.sigT45/2,'.','color','k','markersize',10,'HandleVisibility', 'off')
    plot(-MatData.sigC45/2,-MatData.sigC45/2,'.','color','k','markersize',10,'HandleVisibility', 'off')
    
    plot(0.0,-MatData.SS90,'s','MarkerFaceColor','b','MarkerEdgeColor','b','markersize',6,'HandleVisibility', 'off');
end
set(gca, 'FontSize', 12,'FontName','Times New Roman');
xlabel('\sigma_{yy}=\sigma_{xx}(Mpa)', 'Interpreter', 'tex','FontSize',14,'FontName','Times New Roman')
ylabel('\sigma_{xy}(Mpa)', 'Interpreter', 'tex','FontSize',14,'FontName','Times New Roman')
legend1 =legend('Prop.','Exp. (Input)','Exp. ');
set(legend1,'FontSize',12,'Box','off','FontName','Times New Roman')
hold off
axis equal





figure(4)
for i=1:length(epsm)
    eps=epsm(i);
    MatData =give_matdata_QP1180(eps);
    mdata.c=0;%% 只用于输入
    [plotData1_sx,plotData1_sy,plotData2_sx,plotData2_sy,plotData3,plotData4] = Data_generate_stateAsymHill(mdata,MatData);
    for is=1:length(plotData1_sx)
        lams(is)=eps;
    end
    if(i==1)
        plot3(plotData2_sx,plotData2_sy,lams,'color','r','linewidth',1.5);
    else
        plot3(plotData2_sx,plotData2_sy,lams,'color','r','linewidth',1.5,'HandleVisibility', 'off');
    end
    hold on;
    if(i==1)
        plot3(MatData.sigBT,0,eps,'.','color','k','markersize',15)
        plot3(0.0,MatData.SS00,eps,'s','MarkerFaceColor','b','MarkerEdgeColor','b','markersize',6);
    else
        plot3(MatData.sigBT,0,eps,'.','color','k','markersize',15,'HandleVisibility', 'off')
        plot3(0.0,MatData.SS00,eps,'s','MarkerFaceColor','b','MarkerEdgeColor','b','markersize',6,'HandleVisibility', 'off');
    end
 
    plot3(-MatData.sigBC,0,eps,'.','color','k','markersize',15,'HandleVisibility', 'off')

    plot3(MatData.sigBT,0,eps,'.','color','k','markersize',15,'HandleVisibility', 'off')
    plot3(MatData.sigT45/2,MatData.sigT45/2,eps,'.','color','k','markersize',15,'HandleVisibility', 'off')
    plot3(-MatData.sigC45/2,-MatData.sigC45/2,eps,'.','color','k','markersize',15,'HandleVisibility', 'off')
    
    plot3(0.0,-MatData.SS90,eps,'s','MarkerFaceColor','b','MarkerEdgeColor','b','markersize',6,'HandleVisibility', 'off');
end
set(gca, 'FontSize', 12,'FontName','Times New Roman');
xlabel('\sigma_{yy}=\sigma_{xx}(Mpa)', 'Interpreter', 'tex','FontSize',14,'FontName','Times New Roman')
ylabel('\sigma_{xy}(Mpa)', 'Interpreter', 'tex','FontSize',14,'FontName','Times New Roman')
zlabel('Effective plastic strain', 'Interpreter', 'tex','FontSize',14,'FontName','Times New Roman')
legend1 =legend('Prop.','Exp. (Input)','Exp. ');
set(legend1,'FontSize',12,'Box','off','FontName','Times New Roman')
hold off




%% 绘制流动应力硬化曲线
epsd=a1:0.001:b1;
yieldType=-2;
calType=0;
for i=1:length(epsd)
eps=epsd(i);
MatData =give_matdata_QP1180(eps);
mdata=0;
% 单轴拉伸
sig.xx=1.0;
sig.yy=0;
sig.xy=0;
sim=effect_stress(MatData,mdata,sig,calType,yieldType);
sigT00Pre(i)=MatData.sigT00/sim;

sig.xx=0.5;
sig.yy=0.5;
sig.xy=0.5;
sim=effect_stress(MatData,mdata,sig,calType,yieldType);
sigT45Pre(i)=MatData.sigT00/sim;

sig.xx=0;
sig.yy=1;
sig.xy=0;
sim=effect_stress(MatData,mdata,sig,calType,yieldType);
sigT90Pre(i)=MatData.sigT00/sim;


sig.xx=1;
sig.yy=1;
sig.xy=0;
sim=effect_stress(MatData,mdata,sig,calType,yieldType);
sigBTPre(i)=MatData.sigT00/sim;

% 单轴压缩
sig.xx=-1.0;
sig.yy=0;
sig.xy=0;
sim=effect_stress(MatData,mdata,sig,calType,yieldType);
sigC00Pre(i)=MatData.sigT00/sim;

sig.xx=-0.5;
sig.yy=-0.5;
sig.xy=-0.5;
sim=effect_stress(MatData,mdata,sig,calType,yieldType);
sigC45Pre(i)=MatData.sigT00/sim;

sig.xx=0;
sig.yy=-1;
sig.xy=0;
sim=effect_stress(MatData,mdata,sig,calType,yieldType);
sigC90Pre(i)=MatData.sigT00/sim;

sig.xx=-1;
sig.yy=-1;
sig.xy=0;
sim=effect_stress(MatData,mdata,sig,calType,yieldType);
sigBCPre(i)=MatData.sigT00/sim;

% 平面应变拉伸

sig.xx=1;
sig.yy=0.5;
sig.xy=0;
sim=effect_stress(MatData,mdata,sig,calType,yieldType);
sigTPS00Pre(i)=MatData.sigT00/sim;

sig.xx=0.75;
sig.yy=0.75;
sig.xy=0.25;
sim=effect_stress(MatData,mdata,sig,calType,yieldType);
sigTPS45Pre(i)=MatData.sigT00/sim;

sig.xx=0.5;
sig.yy=1;
sig.xy=0. ;
sim=effect_stress(MatData,mdata,sig,calType,yieldType);
sigTPS90Pre(i)=MatData.sigT00/sim;

% 剪切
sig.xx=0;
sig.yy=0;
sig.xy=1;
sim=effect_stress(MatData,mdata,sig,calType,yieldType);
sigSS00Pre(i)=MatData.sigT00/sim;

sig.xx=1;
sig.yy=-1;
sig.xy=0;
sim=effect_stress(MatData,mdata,sig,calType,yieldType);
sigSS45Pre(i)=MatData.sigT00/sim;

sig.xx=0;
sig.yy=0;
sig.xy=-1;
sim=effect_stress(MatData,mdata,sig,calType,yieldType);
sigSS90Pre(i)=MatData.sigT00/sim;

end

epsE=linspace(a1, b1, 20);
for i=1:length(epsE)
eps=epsE(i);
MatData =give_matdata_QP1180(eps);
mdata=0;
% 单轴拉伸
sigT00Exp(i)=MatData.sigT00;
sigT45Exp(i)=MatData.sigT45;
sigT90Exp(i)=MatData.sigT90;
sigBTExp(i)=MatData.sigBT;

% 单轴压缩
sigC00Exp(i)=MatData.sigC00;
sigC45Exp(i)=MatData.sigC45;
sigC90Exp(i)=MatData.sigC90;
sigBCExp(i)=MatData.sigBC;

% 平面应变拉伸

sigTPS00Exp(i)=MatData.TPS00;
sigTPS45Exp(i)=MatData.TPS45;
sigTPS90Exp(i)=MatData.TPS90;

% 剪切
sigSS00Exp(i)=MatData.SS00;
sigSS45Exp(i)=MatData.SS45;
sigSS90Exp(i)=MatData.SS90;
end

figure
plot(epsd,sigT00Pre,'linewidth',1,'color','r');
hold on
plot(epsd,sigT45Pre,'linewidth',1,'color','b');
plot(epsd,sigT90Pre,'linewidth',1,'color',[0.4660 0.6740 0.1880]);
plot(epsd,sigBTPre,'linewidth',1,'color','m');
plot(epsE,sigT00Exp,'s','MarkerEdgeColor','r','MarkerFaceColor','r','markersize',5);
plot(epsE,sigT45Exp,'d','MarkerEdgeColor','b','MarkerFaceColor','b','markersize',5);
plot(epsE,sigT90Exp,'^','MarkerEdgeColor',[0.4660 0.6740 0.1880],'MarkerFaceColor',[0.4660 0.6740 0.1880],'markersize',5);
plot(epsE,sigBTExp,'v','MarkerEdgeColor','m','MarkerFaceColor','m','markersize',5);
set(gca, 'FontSize', 12,'FontName','Times New Roman');
xlabel('Effective plastic strain','FontSize',14,'FontName','Times New Roman')
ylabel('Effective stress (Mpa)','FontSize',14,'FontName','Times New Roman')
legend1 =legend('Prop. UT00','Prop. UT45','Prop. UT90','Prop. EBT','Exp. UT00','Exp. UT45','Exp. UT90','Exp. EBT','Location','Southeast');
set(legend1,'FontSize',12,'Box','off','FontName','Times New Roman')
hold off


figure
plot(epsd,sigC00Pre,'linewidth',1,'color','r');
hold on
plot(epsd,sigC45Pre,'linewidth',1,'color','b');
plot(epsd,sigC90Pre,'linewidth',1,'color',[0.4660 0.6740 0.1880]);
plot(epsd,sigBCPre,'linewidth',1,'color','m');
plot(epsE,sigC00Exp,'s','MarkerEdgeColor','r','MarkerFaceColor','r','markersize',5);
plot(epsE,sigC45Exp,'d','MarkerEdgeColor','b','MarkerFaceColor','b','markersize',5);
plot(epsE,sigC90Exp,'^','MarkerEdgeColor',[0.4660 0.6740 0.1880],'MarkerFaceColor',[0.4660 0.6740 0.1880],'markersize',5);
plot(epsE,sigBCExp,'v','MarkerEdgeColor','m','MarkerFaceColor','m','markersize',5);
set(gca, 'FontSize', 12,'FontName','Times New Roman');
xlabel('Effective plastic strain','FontSize',14,'FontName','Times New Roman')
ylabel('Effective stress (Mpa)','FontSize',14,'FontName','Times New Roman')
legend1 =legend('Prop. UC00','Prop. UC45','Prop. UC90','Prop. EBC','Exp. UC00','Exp. UC45','Exp. UC90','Exp. EBC','Location','Southeast');
set(legend1,'FontSize',12,'Box','off','FontName','Times New Roman')
hold off


figure
plot(epsd,sigTPS00Pre,'linewidth',1,'color','r');
hold on
plot(epsd,sigTPS45Pre,'linewidth',1,'color','b');
plot(epsd,sigTPS90Pre,'linewidth',1,'color',[0.4660 0.6740 0.1880]);

plot(epsE,sigTPS00Exp,'s','MarkerEdgeColor','r','MarkerFaceColor','r','markersize',5);
plot(epsE,sigTPS45Exp,'d','MarkerEdgeColor','b','MarkerFaceColor','b','markersize',5);
plot(epsE,sigTPS90Exp,'^','MarkerEdgeColor',[0.4660 0.6740 0.1880],'MarkerFaceColor',[0.4660 0.6740 0.1880],'markersize',5);
set(gca, 'FontSize', 12,'FontName','Times New Roman');
xlabel('Effective plastic strain','FontSize',14,'FontName','Times New Roman')
ylabel('Effective stress (Mpa)','FontSize',14,'FontName','Times New Roman')
legend1 =legend('Prop. PST00','Prop. PST45','Prop. PST90','Exp. PST00','Exp. PST45','Exp. PST90','Location','Southeast');
set(legend1,'FontSize',12,'Box','off','FontName','Times New Roman')
ylim([1000,1800]);
hold off

figure
plot(epsd,sigSS00Pre,'linewidth',1,'color','r');
hold on
plot(epsd,sigSS45Pre,'linewidth',1,'color','b');
plot(epsd,sigSS90Pre,'linewidth',1,'color',[0.4660 0.6740 0.1880]);

plot(epsE,sigSS00Exp,'s','MarkerEdgeColor','r','MarkerFaceColor','r','markersize',5);
plot(epsE,sigSS45Exp,'d','MarkerEdgeColor','b','MarkerFaceColor','b','markersize',5);
plot(epsE,sigSS90Exp,'^','MarkerEdgeColor',[0.4660 0.6740 0.1880],'MarkerFaceColor',[0.4660 0.6740 0.1880],'markersize',5);
set(gca, 'FontSize', 12,'FontName','Times New Roman');
xlabel('Effective plastic strain','FontSize',14,'FontName','Times New Roman')
ylabel('Effective stress (Mpa)','FontSize',14,'FontName','Times New Roman')
legend1 =legend('Prop. SS00','Prop. SS45','Prop. SS90','Exp. SS00','Exp. SS45','Exp. SS90','Location','Southeast');
set(legend1,'FontSize',12,'Box','off','FontName','Times New Roman')
ylim([200,1000]);
hold off

%% 模型参数的演化
epsE=linspace(a1, b1, 35);
for i=1:length(epsE)
eps=epsE(i);
MatData =give_matdata_QP1180(eps);
mdata = call_factor_of_StateAsymHill(MatData);

ay(i)=mdata.ay;
by(i)=mdata.by;
cy(i)=mdata.cy;
dy(i)=mdata.dy;
ey(i)=mdata.ey;
fy(i)=mdata.fy;
gy(i)=mdata.gy;

a(i)=mdata.a;
b(i)=mdata.b;
c(i)=mdata.c;
d(i)=mdata.d;
e(i)=mdata.e; 
g(i)=mdata.g; 

end

figure
plot(epsE,a,'-^r','MarkerEdgeColor','r','MarkerFaceColor','r','markersize',5);
hold on;
plot(epsE,b,'-vg','MarkerEdgeColor','g','MarkerFaceColor','g','markersize',5);
plot(epsE,c,'-^b','MarkerEdgeColor','b','MarkerFaceColor','b','markersize',5);
plot(epsE,d,'->c','MarkerEdgeColor','c','MarkerFaceColor','c','markersize',5);
plot(epsE,e,'-<m','MarkerEdgeColor','m','MarkerFaceColor','m','markersize',5);
plot(epsE,g,'-dk','MarkerEdgeColor','k','MarkerFaceColor','k','markersize',5);

set(gca, 'FontSize', 12,'FontName','Times New Roman');
xlabel('Effective plastic strain','FontSize',14,'FontName','Times New Roman')
ylabel('Differential coefficients ','FontSize',14,'FontName','Times New Roman')
legend1 =legend('a','b','c','d','e','g');
set(legend1,'FontSize',12,'Box','off','FontName','Times New Roman')
hold off

figure
plot(epsE,ay,'-^r','MarkerEdgeColor','r','MarkerFaceColor','r','markersize',5);
hold on;
plot(epsE,by,'-vg','MarkerEdgeColor','g','MarkerFaceColor','g','markersize',5);
plot(epsE,cy,'-^b','MarkerEdgeColor','b','MarkerFaceColor','b','markersize',5);
plot(epsE,dy,'->c','MarkerEdgeColor','c','MarkerFaceColor','c','markersize',5);
plot(epsE,ey,'-<m','MarkerEdgeColor','m','MarkerFaceColor','m','markersize',5);
plot(epsE,fy,'-dk','MarkerEdgeColor','k','MarkerFaceColor','k','markersize',5);
plot(epsE,gy,'-s','color',[0.4660 0.6740 0.1880],'MarkerEdgeColor',[0.4660 0.6740 0.1880],'MarkerFaceColor',[0.4660 0.6740 0.1880],'markersize',5);


set(gca, 'FontSize', 12,'FontName','Times New Roman');
xlabel('Effective plastic strain','FontSize',14,'FontName','Times New Roman')
ylabel('Anisotropic coefficients ','FontSize',14,'FontName','Times New Roman')
legend1 =legend('ay','by','cy','dy','ey','fy','gy');
set(legend1,'FontSize',12,'Box','off','FontName','Times New Roman')
hold off
