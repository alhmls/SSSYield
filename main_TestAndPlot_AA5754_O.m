clear
clc
close all
[Mdata_AA5754_O] =  give_matdata_AA5754_O(0.002);

MatData=Mdata_AA5754_O;

mdata.c=0.0; 

[plotData1_prop_sx,plotData1_prop_sy,plotData2_prop_sx,plotData2_prop_sy,plotData3_prop,plotData4_prop] = Data_generate_stateAsymHill(mdata,MatData);
[plotData1_ZhangLou2024_sx,plotData1_ZhangLou2024_sy,plotData2_ZhangLou2024_sx,plotData2_ZhangLou2024_sy,plotData3_ZhangLou2024,plotData4_ZhangLou2024] = Data_generate_ZhangLou2024(mdata,MatData);
[mdata]=cal_mdata_Hou2023(MatData,3);
[plotData1_Hou2023_sx,plotData1_Hou2023_sy,plotData2_Hou2023_sx,plotData2_Hou2023_sy,plotData3_Hou2023,plotData4_Hou2023] = Data_generate_Hou2023(mdata,MatData);

%% 法平面的轨迹
figure(1)
plot(plotData1_prop_sx,plotData1_prop_sy,'linewidth',1,'color','r');
hold on 
plot(plotData1_ZhangLou2024_sx,plotData1_ZhangLou2024_sy,'linewidth',1,'color','b');
plot(plotData1_Hou2023_sx,plotData1_Hou2023_sy,'linewidth',1,'color',[0.4660 0.6740 0.1880]);
set(gca, 'FontSize', 12,'FontName','Times New Roman');
xlabel('\sigma_{xx}(MPa)','FontSize',16,'FontName','Times New Roman')
ylabel('\sigma_{yy}(MPa)','FontSize',16,'FontName','Times New Roman')
plot(MatData.Txy00,0,'.','color','k','markersize',15)
plot(0,MatData.Txy90,'.','color','k','markersize',15)
plot(-MatData.Cxy00,0,'.','color','k','markersize',15)
plot(0,-MatData.sigUC,'.','color','k','markersize',15)
plot(MatData.sigPST,MatData.sigPST/2,'.','color','k','markersize',15)
plot(MatData.TPS90/2,MatData.TPS90,'.','color','k','markersize',15);
plot(MatData.sigSS,-MatData.sigSS,'.','color','k','markersize',15)

plot(MatData.sigBT,MatData.sigBT,'.','color','k','markersize',15)
plot(-MatData.sigBC,-MatData.sigBC,'.','color','k','markersize',15)

legend1 =legend('Proposed model','Zhang & Lou (2024)','Hou et al. (2023)','Exp. Data');
set(legend1,'FontSize',12,'FontName','Times New Roman','Box','off')

hold off
axis equal

figure(2)
%% 对角平面的轨迹
figure(2)
plot(plotData2_prop_sx,plotData2_prop_sy,'linewidth',1,'color','r');
hold on 
plot(plotData2_ZhangLou2024_sx,plotData2_ZhangLou2024_sy,'linewidth',1,'color','b');
plot(plotData2_Hou2023_sx,plotData2_Hou2023_sy,'linewidth',1,'color',[0.4660 0.6740 0.1880]);
set(gca, 'FontSize', 12,'FontName','Times New Roman');
xlabel('\sigma_{xx}=\sigma_{yy}(MPa)','FontSize',16,'FontName','Times New Roman')
ylabel('\sigma_{xy}(MPa)','FontSize',16,'FontName','Times New Roman')
plot(MatData.sigBT,0,'.','color','k','markersize',15)
plot(-MatData.sigBC,0,'.','color','k','markersize',15)

plot(MatData.sigBT,0,'.','color','k','markersize',15)
plot(MatData.sigT45/2,MatData.sigT45/2,'.','color','k','markersize',15)
plot(-MatData.sigC45/2,-MatData.sigC45/2,'.','color','k','markersize',15)

legend1 =legend('Proposed model','Zhang & Lou (2024)','Hou et al. (2023)','Exp. Data');
set(legend1,'FontSize',12,'FontName','Times New Roman','Box','off')

hold off
axis equal


%% 平面应力三维轨迹
dotcolor=[0 0 0];
figure(3)
s2=surf(plotData3_prop.Sxx,plotData3_prop.Syy,plotData3_prop.Sxy,'FaceAlpha','0.5');
% shading interp
hold on;
plot3(plotData3_prop.nmsigxx,plotData3_prop.nmsigyy,plotData3_prop.nmsigxy,'linewidth',1.5,'color','r');
plot3(plotData3_prop.dmsigxx,plotData3_prop.dmsigyy,plotData3_prop.dmsigxy,'linewidth',1.5,'color','g');
plot3(plotData3_prop.utsigxx,plotData3_prop.utsigyy,plotData3_prop.utsigxy,'linewidth',1.5,'color','b');
plot3(plotData3_prop.ucsigxx,plotData3_prop.ucsigyy,plotData3_prop.ucsigxy,'linewidth',1.5,'color','m');

plot3(MatData.sigT00,0,0,'.','color',dotcolor,'markersize',20)
plot3(0,MatData.sigT90,0,'.','color',dotcolor,'markersize',20)
plot3(-MatData.sigC00,0,0,'.','color',dotcolor,'markersize',20)
plot3(0,-MatData.sigUC,0,'.','color',dotcolor,'markersize',20)
plot3(MatData.sigPST,MatData.sigPST/2,0,'.','color',dotcolor,'markersize',20)
plot3(MatData.TPS90/2,MatData.TPS90,0,'.','color','k','markersize',15);
plot3(MatData.sigSS,-MatData.sigSS,0,'.','color',dotcolor,'markersize',20)
plot3(MatData.sigBT,MatData.sigBT,0,'.','color',dotcolor,'markersize',20)
plot3(-MatData.sigBC,-MatData.sigBC,0,'.','color',dotcolor,'markersize',20)
plot3(MatData.sigT45/2,MatData.sigT45/2,MatData.sigT45/2,'.','color',dotcolor,'markersize',20)
plot3(-MatData.sigC45/2,-MatData.sigC45/2,-MatData.sigC45/2,'.','color',dotcolor,'markersize',20)
axis equal
hold off
set(gca, 'FontSize', 12,'FontName','Times New Roman');
xlabel('{\sigma}_{xx}(MPa)','FontSize',12,'FontName','Times New Roman')
ylabel('{\sigma}_{yy}(MPa)','FontSize',12,'FontName','Times New Roman')
zlabel('{\sigma}_{xy}(MPa)','FontSize',12,'FontName','Times New Roman')


%% 单轴拉压角度
figure(4)
plot(plotData4_prop.Theta,plotData4_prop.sbxyT,'linewidth',1.5,'color','r');
hold on
plot(plotData4_ZhangLou2024.Theta,plotData4_ZhangLou2024.sbxyT,'linewidth',1.2,'color','b');
plot(plotData4_Hou2023.Theta,plotData4_Hou2023.sbxyT,'linewidth',0.9,'color',[0.4660 0.6740 0.1880]);

plot(0,MatData.sigT00,'d','MarkerFaceColor','m','MarkerEdgeColor','m','markersize',6)
plot(15,MatData.sigT15,'d','MarkerFaceColor','m','MarkerEdgeColor','m','markersize',6,'HandleVisibility', 'off')
plot(30,MatData.sigT30,'d','MarkerFaceColor','m','MarkerEdgeColor','m','markersize',6,'HandleVisibility', 'off')
plot(45,MatData.sigT45,'d','MarkerFaceColor','m','MarkerEdgeColor','m','markersize',6,'HandleVisibility', 'off')
plot(60,MatData.sigT60,'d','MarkerFaceColor','m','MarkerEdgeColor','m','markersize',6,'HandleVisibility', 'off')
plot(75,MatData.sigT75,'d','MarkerFaceColor','m','MarkerEdgeColor','m','markersize',6,'HandleVisibility', 'off')
plot(90,MatData.sigT90,'d','MarkerFaceColor','m','MarkerEdgeColor','m','markersize',6,'HandleVisibility', 'off')
plot(-90,MatData.sigT90,'d','MarkerFaceColor','m','MarkerEdgeColor','m','markersize',6,'HandleVisibility', 'off')

plot(plotData4_prop.Theta,plotData4_prop.sbxyC,"--",'linewidth',1.5,'color','r');
plot(plotData4_ZhangLou2024.Theta,plotData4_ZhangLou2024.sbxyC,"--",'linewidth',1.2,'color','b');
plot(plotData4_Hou2023.Theta,plotData4_Hou2023.sbxyC,"--",'linewidth',0.9,'color',[0.4660 0.6740 0.1880]);

plot(0,MatData.sigC00,'s','MarkerFaceColor','b','MarkerEdgeColor','b','markersize',7)
plot(45,MatData.sigC45,'s','MarkerFaceColor','b','MarkerEdgeColor','b','markersize',7,'HandleVisibility', 'off')
plot(90,MatData.sigC90,'s','MarkerFaceColor','b','MarkerEdgeColor','b','markersize',7,'HandleVisibility', 'off')
plot(-90,MatData.sigC90,'s','MarkerFaceColor','b','MarkerEdgeColor','b','markersize',7,'HandleVisibility', 'off')
set(gca, 'FontSize', 12,'FontName','Times New Roman');
legend1 =legend('Proposed model','Zhang & Lou (2024)','Hou et al. (2023)','Exp. Data','Proposed model','Zhang & Lou (2024)','Hou et al. (2023)','Exp. Data');
set(legend1,'FontSize',12,'FontName','Times New Roman','Box','off')
xlabel('Loading angle [°]','FontSize',16,'FontName','Times New Roman')
ylabel('Uniaxial yield stress (Mpa)','FontSize',16,'FontName','Times New Roman')
ylim([90,115])
%%
% plot_potential_hill(0.65,0.65, 0.72,0.60,0.75,0.62,MatData.Txy00,MatData.Cxy00)

% %% 凸性检测
% convex=1;
% [convex] = convex_Test_for_StateAsymHill(MatData,MatData.sigT00,-2);

