clear
clc
close all
[Mdata_Az31] = give_matdata_Az31(0);
MatData=Mdata_Az31;
mdata.c=0.0;

[plotData1_sx_1,plotData1_sy_1,plotData2_sx_1,plotData2_sy_1,plotData3_1,plotData4_1] = Data_generate_SSSMises(mdata,MatData,1);
[plotData1_sx_2,plotData1_sy_2,plotData2_sx_2,plotData2_sy_2,plotData3_2,plotData4_2] = Data_generate_SSSMises(mdata,MatData,2);
[plotData1_sx_3,plotData1_sy_3,plotData2_sx_3,plotData2_sy_3,plotData3_3,plotData4_3] = Data_generate_SSSMises(mdata,MatData,3);
[plotData1_sx_4,plotData1_sy_4,plotData2_sx_4,plotData2_sy_4,plotData3_4,plotData4_4] = Data_generate_SSSMises(mdata,MatData,4);
[plotData1_sx_5,plotData1_sy_5,plotData2_sx_5,plotData2_sy_5,plotData3_5,plotData4_5] = Data_generate_SSSMises(mdata,MatData,5);
[plotData1_sx_0,plotData1_sy_0,plotData2_sx_0,plotData2_sy_0,plotData3_0,plotData4_0] = Data_generate_SSSMises(mdata,MatData,0);
figure(1)
plot(plotData1_sx_0,plotData1_sy_0,'linewidth',1,'color','r');
hold on 
plot(plotData1_sx_2,plotData1_sy_2,'linewidth',1,'color','g');
plot(plotData1_sx_3,plotData1_sy_3,'linewidth',1,'color','b');
plot(plotData1_sx_4,plotData1_sy_4,'linewidth',1,'color','c');
plot(plotData1_sx_5,plotData1_sy_5,'linewidth',1,'color','m');

plot(MatData.sigT00,0,'.','color','k','markersize',15)

plot(0,-MatData.sigUC,'.','color','k','markersize',15)
plot(MatData.sigPST,MatData.sigPST/2,'.','color','k','markersize',15)
plot(MatData.sigSS,-MatData.sigSS,'.','color','k','markersize',15)
plot(MatData.sigBT,MatData.sigBT,'.','color','k','markersize',15)
plot(-MatData.sigBC,-MatData.sigBC,'.','color','k','markersize',15)
if MatData.other==1
    plot(MatData.other1.xx,MatData.other1.yy,'.','color','k','markersize',15)
    plot(MatData.other2.xx,MatData.other2.yy,'.','color','k','markersize',15)
end
hl=legend("EBT, PST, UT, SS, UC, EBC","EBT, PST, UT, SS, UC","EBT, PST, UT, SS","EBT, PST, UT","EBT, UT","Exp. Data");
set(hl,'Box','off');

set(gca, 'FontSize', 12,'FontName','Times New Roman');
axis equal
xlabel('\sigma_{xx}','FontSize',16,'FontName','Times New Roman')
ylabel('\sigma_{xy}','FontSize',16,'FontName','Times New Roman')
hold off



etab=-2:0.01:2;
Mdata=Mdata_Az31;
rightTemp=[];
%  0
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
rightTemp(1)=sigref/sigBC;
rightTemp(2)=sigref/sigUC;
rightTemp(3)=sigref/(sigSS*sqrt(3));
rightTemp(4)=sigref/(sigUT);
rightTemp(5)=sigref/(sigPST*sqrt(3)/2);
rightTemp(6)=sigref/(sigBT);
faeta=Mf\rightTemp';

for i=1:length(etab)
    f_eta0(i)=faeta(1)+faeta(2)*etab(i)+faeta(3)*etab(i)^2+faeta(4)*etab(i)^3+faeta(5)*etab(i)^4+faeta(6)*etab(i)^6;
end

%2
rightTemp=[];
seta=[-1  0 1  sqrt(3)  2 ];
Mf=[1 seta(1) seta(1)^2  seta(1)^4 seta(1)^6;
    1 seta(2) seta(2)^2  seta(2)^4 seta(2)^6;
    1 seta(3) seta(3)^2  seta(3)^4 seta(3)^6;
    1 seta(4) seta(4)^2  seta(4)^4 seta(4)^6;
    1 seta(5) seta(5)^2  seta(5)^4 seta(5)^6];
sigref=Mdata.sigT00;
sigUT=Mdata.sigUT;
sigPST=Mdata.sigPST;
sigBT=Mdata.sigBT;
sigBC=Mdata.sigBC;
sigUC=Mdata.sigUC;
sigSS=Mdata.sigSS;
rightTemp(1)=sigref/sigUC;
rightTemp(2)=sigref/(sigSS*sqrt(3));
rightTemp(3)=sigref/(sigUT);
rightTemp(4)=sigref/(sigPST*sqrt(3)/2);
rightTemp(5)=sigref/(sigBT);
faeta=Mf\rightTemp';
for i=1:length(etab)
    f_eta2(i)=faeta(1)+faeta(2)*etab(i)+faeta(3)*etab(i)^2+faeta(4)*etab(i)^4+faeta(5)*etab(i)^6;
end


%3
rightTemp=[];
seta=[  0 1  sqrt(3)  2 ];
Mf=[1  seta(1)^1  seta(1)^2 seta(1)^6;
    1  seta(2)^1  seta(2)^2 seta(2)^6;
    1  seta(3)^1  seta(3)^2 seta(3)^6;
    1  seta(4)^1  seta(4)^2 seta(4)^6];
sigref=Mdata.sigT00;
sigUT=Mdata.sigUT;
sigPST=Mdata.sigPST;
sigBT=Mdata.sigBT;
sigBC=Mdata.sigBC;
sigUC=Mdata.sigUC;
sigSS=Mdata.sigSS;
rightTemp(1)=sigref/(sigSS*sqrt(3));
rightTemp(2)=sigref/(sigUT);
rightTemp(3)=sigref/(sigPST*sqrt(3)/2);
rightTemp(4)=sigref/(sigBT);
faeta=Mf\rightTemp';
for i=1:length(etab)
   f_eta3(i)=faeta(1)+faeta(2)*etab(i)^1+faeta(3)*etab(i)^2+faeta(4)*etab(i)^6;
end


%4
rightTemp=[];
seta=[  1  sqrt(3)  2 ];
Mf=[1  seta(1)^2  seta(1)^4 ;
    1  seta(2)^2  seta(2)^4 ;
    1  seta(3)^2  seta(3)^4 ];
sigref=Mdata.sigT00;
sigUT=Mdata.sigUT;
sigPST=Mdata.sigPST;
sigBT=Mdata.sigBT;
sigBC=Mdata.sigBC;
sigUC=Mdata.sigUC;
sigSS=Mdata.sigSS;

rightTemp(1)=sigref/(sigUT);
rightTemp(2)=sigref/(sigPST*sqrt(3)/2);
rightTemp(3)=sigref/(sigBT);
faeta=Mf\rightTemp';

for i=1:length(etab)
   f_eta4(i)=faeta(1)+faeta(2)*etab(i)^2+faeta(3)*etab(i)^4;
end

%5
rightTemp=[];
seta=[  1    2 ];
Mf=[1  seta(1)   ;
    1  seta(2)    ];
sigref=Mdata.sigT00;
sigUT=Mdata.sigUT;
sigPST=Mdata.sigPST;
sigBT=Mdata.sigBT;
sigBC=Mdata.sigBC;
sigUC=Mdata.sigUC;
sigSS=Mdata.sigSS;

rightTemp(1)=sigref/(sigUT);
rightTemp(2)=sigref/(sigBT);
faeta=Mf\rightTemp';
for i=1:length(etab)
   f_eta5(i)=faeta(1)+faeta(2)*etab(i);
end
figure(66)
hold on
plot(etab,f_eta0,'linewidth',1,'color','r');
plot(etab,f_eta2,'linewidth',1,'color','g');
plot(etab,f_eta3,'linewidth',1,'color','b');
plot(etab,f_eta4,'linewidth',1,'color','c');
plot(etab,f_eta5,'linewidth',1,'color','m');


plot(-2,sigref/sigBC,'.','color','k','markersize',15);
plot(-1,sigref/sigUC,'.','color','k','markersize',15);
plot(0,sigref/(sigSS*sqrt(3)),'.','color','k','markersize',15);
plot(1,sigref/sigUT,'.','color','k','markersize',15);
plot(sqrt(3),sigref/(sigPST*sqrt(3)/2),'.','color','k','markersize',15);
plot(2,sigref/(sigBT),'.','color','k','markersize',15);

hl=legend("EBT, PST, UT, SS, UC, EBC","EBT, PST, UT, SS, UC","EBT, PST, UT, SS","EBT, PST, UT","EBT, UT","Exp. Data Ratio");
set(hl,'Box','off');
set(gca, 'FontSize', 12,'FontName','Times New Roman');
xlabel('$\overline{\eta}$', 'Interpreter', 'latex','FontSize',16,'FontName','Times New Roman')
ylabel('$f(\overline{\eta})$', 'Interpreter', 'latex','FontSize',16,'FontName','Times New Roman')
box on



