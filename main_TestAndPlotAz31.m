clear
clc
close  all
[Mdata_Az31] = give_matdata_Az31(0.002);
MatData=Mdata_Az31;
mdata.c=0.0;
[plotData1_prop_sx,plotData1_prop_sy,plotData2_prop_sx,plotData2_prop_sy,plotData3_prop,plotData4_prop] = Data_generate_stateAsymHill(mdata,Mdata_Az31);
[plotData1_ZhangLou2024_sx,plotData1_ZhangLou2024_sy,plotData2_ZhangLou2024_sx,plotData2_ZhangLou2024_sy,plotData3_ZhangLou2024,plotData4_ZhangLou2024] = Data_generate_ZhangLou2024(mdata,Mdata_Az31);
[mdata]=cal_mdata_Hou2023(MatData,4);
[plotData1_Hou2023_sx,plotData1_Hou2023_sy,plotData2_Hou2023_sx,plotData2_Hou2023_sy,plotData3_Hou2023,plotData4_Hou2023] = Data_generate_Hou2023(mdata,MatData);


%% 法平面的轨迹
figure(1)
plot(plotData1_prop_sx,plotData1_prop_sy,'linewidth',1,'color','r');
hold on 
plot(plotData1_ZhangLou2024_sx,plotData1_ZhangLou2024_sy,'linewidth',1,'color','b');
plot(plotData1_Hou2023_sx,plotData1_Hou2023_sy,'linewidth',1,'color',[0.4660 0.6740 0.1880]);
set(gca, 'FontSize', 12,'FontName','Times New Roman');
xlabel('\sigma_{xx}','FontSize',16,'FontName','Times New Roman')
ylabel('\sigma_{yy}','FontSize',16,'FontName','Times New Roman')
plot(Mdata_Az31.sigT00,0,'.','color','k','markersize',15)
plot(0,Mdata_Az31.sigT90,'.','color','k','markersize',15,'HandleVisibility', 'off')
plot(-Mdata_Az31.sigC00,0,'.','color','k','markersize',15,'HandleVisibility', 'off')
plot(0,-Mdata_Az31.sigUC,'.','color','k','markersize',15,'HandleVisibility', 'off')
plot(Mdata_Az31.sigPST,Mdata_Az31.sigPST/2,'.','color','k','markersize',15,'HandleVisibility', 'off')
plot(Mdata_Az31.sigSS,-Mdata_Az31.sigSS,'.','color','k','markersize',15,'HandleVisibility', 'off')
% plot(-matdata.sigPSC/2,-matdata.sigPSC,'.','color','k','markersize',15)
plot(Mdata_Az31.sigBT,Mdata_Az31.sigBT,'.','color','k','markersize',15,'HandleVisibility', 'off')
plot(-Mdata_Az31.sigBC,-Mdata_Az31.sigBC,'.','color','k','markersize',15,'HandleVisibility', 'off')
if Mdata_Az31.other==1
    plot(Mdata_Az31.other1.xx,Mdata_Az31.other1.yy,'.','color','k','markersize',15,'HandleVisibility', 'off')
    plot(Mdata_Az31.other2.xx,Mdata_Az31.other2.yy,'.','color','k','markersize',15,'HandleVisibility', 'off')
    plot(Mdata_Az31.other3.xx,Mdata_Az31.other3.yy,'.','color','k','markersize',15,'HandleVisibility', 'off')
    plot(Mdata_Az31.other4.xx,Mdata_Az31.other4.yy,'.','color','k','markersize',15,'HandleVisibility', 'off')
    plot(Mdata_Az31.other5.xx,Mdata_Az31.other5.yy,'.','color','k','markersize',15,'HandleVisibility', 'off')
end
hold off
axis equal
legend1 =legend('Proposed model','Zhang & Lou (2024)','Hou et al. (2023)','Exp. Data');
set(legend1,'FontSize',12,'Box','off')

figure(2)
%% 对角平面的轨迹
figure(2)
plot(plotData2_prop_sx,plotData2_prop_sy,'linewidth',1,'color','r');
hold on 
plot(plotData2_ZhangLou2024_sx,plotData2_ZhangLou2024_sy,'linewidth',1,'color','b');
plot(plotData2_Hou2023_sx,plotData2_Hou2023_sy,'linewidth',1,'color',[0.4660 0.6740 0.1880]);
set(gca, 'FontSize', 12,'FontName','Times New Roman');
xlabel('\sigma_{xx}=\sigma_{yy}','FontSize',16,'FontName','Times New Roman')
ylabel('\sigma_{xy}','FontSize',16,'FontName','Times New Roman')
plot(Mdata_Az31.sigBT,0,'.','color','k','markersize',15)
plot(-Mdata_Az31.sigBC,0,'.','color','k','markersize',15)

plot(Mdata_Az31.sigBT,0,'.','color','k','markersize',15)
plot(Mdata_Az31.sigT45/2,Mdata_Az31.sigT45/2,'.','color','k','markersize',15)
plot(-Mdata_Az31.sigC45/2,-Mdata_Az31.sigC45/2,'.','color','k','markersize',15)

legend1 =legend('Proposed model','Zhang & Lou (2024)','Hou et al. (2023)','Exp. Data');
set(legend1,'FontSize',12,'Box','off')
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

plot3(Mdata_Az31.sigT00,0,0,'.','color',dotcolor,'markersize',20)
plot3(0,Mdata_Az31.sigT90,0,'.','color',dotcolor,'markersize',20)
plot3(-Mdata_Az31.sigC00,0,0,'.','color',dotcolor,'markersize',20)
plot3(0,-Mdata_Az31.sigUC,0,'.','color',dotcolor,'markersize',20)
plot3(Mdata_Az31.sigPST,Mdata_Az31.sigPST/2,0,'.','color',dotcolor,'markersize',20)
plot3(Mdata_Az31.sigSS,-Mdata_Az31.sigSS,0,'.','color',dotcolor,'markersize',20)
plot3(Mdata_Az31.sigBT,Mdata_Az31.sigBT,0,'.','color',dotcolor,'markersize',20)
plot3(-Mdata_Az31.sigBC,-Mdata_Az31.sigBC,0,'.','color',dotcolor,'markersize',20)
if Mdata_Az31.other==1
    plot3(Mdata_Az31.other1.xx,Mdata_Az31.other1.yy,0.,'.','color','k','markersize',20)
    plot3(Mdata_Az31.other2.xx,Mdata_Az31.other2.yy,0.,'.','color','k','markersize',20)
    plot3(Mdata_Az31.other3.xx,Mdata_Az31.other3.yy,0.,'.','color','k','markersize',20)
    plot3(Mdata_Az31.other4.xx,Mdata_Az31.other4.yy,0.,'.','color','k','markersize',20)
    plot3(Mdata_Az31.other5.xx,Mdata_Az31.other5.yy,0.,'.','color','k','markersize',20)
end
plot3(Mdata_Az31.sigT45/2,Mdata_Az31.sigT45/2,Mdata_Az31.sigT45/2,'.','color',dotcolor,'markersize',20)
plot3(-Mdata_Az31.sigC45/2,-Mdata_Az31.sigC45/2,-Mdata_Az31.sigC45/2,'.','color',dotcolor,'markersize',20)
set(gca, 'FontSize', 12,'FontName','Times New Roman');
axis equal
hold off
xlabel('{\sigma}_{xx}','FontSize',12,'FontName','Times New Roman')
ylabel('{\sigma}_{yy}','FontSize',12,'FontName','Times New Roman')
zlabel('{\sigma}_{xy}','FontSize',12,'FontName','Times New Roman')


%% 单轴拉压角度
figure(4)
plot(plotData4_prop.Theta,plotData4_prop.sbxyT,'linewidth',1.5,'color','r');
hold on
plot(plotData4_ZhangLou2024.Theta,plotData4_ZhangLou2024.sbxyT,'linewidth',1.2,'color','b');
plot(plotData4_Hou2023.Theta,plotData4_Hou2023.sbxyT,'linewidth',0.9,'color',[0.4660 0.6740 0.1880]);
plot(-90,Mdata_Az31.sigT90,'d','MarkerFaceColor','m','MarkerEdgeColor','m','markersize',6,'HandleVisibility', 'off')
plot(0,Mdata_Az31.sigT00,'d','MarkerFaceColor','m','MarkerEdgeColor','m','markersize',6)
plot(45,Mdata_Az31.sigT45,'d','MarkerFaceColor','m','MarkerEdgeColor','m','markersize',6,'HandleVisibility', 'off')
plot(90,Mdata_Az31.sigT90,'d','MarkerFaceColor','m','MarkerEdgeColor','m','markersize',6,'HandleVisibility', 'off')


plot(plotData4_prop.Theta,plotData4_prop.sbxyC,"--",'linewidth',1.5,'color','r');
plot(plotData4_ZhangLou2024.Theta,plotData4_ZhangLou2024.sbxyC,"--",'linewidth',1.2,'color','b');
plot(plotData4_Hou2023.Theta,plotData4_Hou2023.sbxyC,"--",'linewidth',0.9,'color',[0.4660 0.6740 0.1880]);

plot(0,Mdata_Az31.sigC00,'s','MarkerFaceColor','b','MarkerEdgeColor','b','markersize',7)
plot(45,Mdata_Az31.sigC45,'s','MarkerFaceColor','b','MarkerEdgeColor','b','markersize',7,'HandleVisibility', 'off')
plot(90,Mdata_Az31.sigC90,'s','MarkerFaceColor','b','MarkerEdgeColor','b','markersize',7,'HandleVisibility', 'off')
plot(-90,Mdata_Az31.sigC90,'s','MarkerFaceColor','b','MarkerEdgeColor','b','markersize',7,'HandleVisibility', 'off')
set(gca, 'FontSize', 12,'FontName','Times New Roman');

legend1 =legend('Proposed model','Zhang & Lou (2024)','Hou et al. (2023)','Exp. Data','Proposed model','Zhang & Lou (2024)','Hou et al. (2023)','Exp. Data');
set(legend1,'FontSize',12,'Box','off')

xlabel('Loading angle [°]','FontSize',16,'FontName','Times New Roman')
ylabel('Uniaxial yield stress (Mpa)','FontSize',16,'FontName','Times New Roman')

hold off

% %% 凸性检测
% % convex=1;
% % [convex] = convex_Test_for_StateAsymHill(Mdata_Az31,Mdata_Az31.sigT00,-2);



