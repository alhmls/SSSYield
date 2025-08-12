clear
clc
close all

c=-3.375;
d=0;
b=0.0;
a=1/(1/3*(sqrt(27-4*c)-2*d)^(1/3));
mdata.a=a;
mdata.b=b;
mdata.c=c;
mdata.d=d;
matdata.sigT00=1.;
[plotData1_Lou2022_sx_1,plotData1_Lou2022_sy_1,plotData2_Lou2022_sx_1,plotData2_Lou2022_sy_1,plotData3_Lou2022_1,plotData4_Lou2022_1]...
    = Data_generate_Lou2022(mdata,matdata);
[plotData1_NewLou2022_sx_1,plotData1_NewLou2022_sy_1,plotData2_NewLou2022_sx_1,plotData2_NewLou2022_sy_1,plotData3_NewLou2022_1,plotData4_NewLou2022_1]...
    = Data_generate_NewLou2022(mdata,matdata);



c=2.25;
d=0;
b=0.0;
a=1/(1/3*(sqrt(27-4*c)-2*d)^(1/3));
mdata.a=a;
mdata.b=b;
mdata.c=c;
mdata.d=d;
matdata.sigT00=1.;
[plotData1_Lou2022_sx_2,plotData1_Lou2022_sy_2,plotData2_Lou2022_sx_2,plotData2_Lou2022_sy_2,plotData3_Lou2022_2,plotData4_Lou2022_2]...
    = Data_generate_Lou2022(mdata,matdata);
[plotData1_NewLou2022_sx_2,plotData1_NewLou2022_sy_2,plotData2_NewLou2022_sx_2,plotData2_NewLou2022_sy_2,plotData3_NewLou2022_2,plotData4_NewLou2022_2]...
    = Data_generate_NewLou2022(mdata,matdata);


c=0;
d=1.299;
b=0.0;
a=1/(1/3*(sqrt(27-4*c)-2*d)^(1/3));
mdata.a=a;
mdata.b=b;
mdata.c=c;
mdata.d=d;
matdata.sigT00=1.;
[plotData1_Lou2022_sx_3,plotData1_Lou2022_sy_3,plotData2_Lou2022_sx_3,plotData2_Lou2022_sy_3,plotData3_Lou2022_3,plotData4_Lou2022_3]...
    = Data_generate_Lou2022(mdata,matdata);
[plotData1_NewLou2022_sx_3,plotData1_NewLou2022_sy_3,plotData2_NewLou2022_sx_3,plotData2_NewLou2022_sy_3,plotData3_NewLou2022_3,plotData4_NewLou2022_3]...
    = Data_generate_NewLou2022(mdata,matdata);

c=0;
d=-1.299;
b=0.0;
a=1/(1/3*(sqrt(27-4*c)-2*d)^(1/3));
mdata.a=a;
mdata.b=b;
mdata.c=c;
mdata.d=d;
matdata.sigT00=1.;
[plotData1_Lou2022_sx_4,plotData1_Lou2022_sy_4,plotData2_Lou2022_sx_4,plotData2_Lou2022_sy_4,plotData3_Lou2022_4,plotData4_Lou2022_4]...
    = Data_generate_Lou2022(mdata,matdata);
[plotData1_NewLou2022_sx_4,plotData1_NewLou2022_sy_4,plotData2_NewLou2022_sx_4,plotData2_NewLou2022_sy_4,plotData3_NewLou2022_4,plotData4_NewLou2022_4]...
    = Data_generate_NewLou2022(mdata,matdata);

c=0.402;
d=1.45;
b=0.0;
a=1/(1/3*(sqrt(27-4*c)-2*d)^(1/3));
mdata.a=a;
mdata.b=b;
mdata.c=c;
mdata.d=d;
matdata.sigT00=1.;
[plotData1_Lou2022_sx_5,plotData1_Lou2022_sy_5,plotData2_Lou2022_sx_5,plotData2_Lou2022_sy_5,plotData3_Lou2022_5,plotData4_Lou2022_5]...
    = Data_generate_Lou2022(mdata,matdata);
[plotData1_NewLou2022_sx_5,plotData1_NewLou2022_sy_5,plotData2_NewLou2022_sx_5,plotData2_NewLou2022_sy_5,plotData3_NewLou2022_5,plotData4_NewLou2022_5]...
    = Data_generate_NewLou2022(mdata,matdata);



c=0.402;
d=-1.45;
b=0.0;
a=1/(1/3*(sqrt(27-4*c)-2*d)^(1/3));
mdata.a=a;
mdata.b=b;
mdata.c=c;
mdata.d=d;
matdata.sigT00=1.;
[plotData1_Lou2022_sx_6,plotData1_Lou2022_sy_6,plotData2_Lou2022_sx_6,plotData2_Lou2022_sy_6,plotData3_Lou2022_6,plotData4_Lou2022_6]...
    = Data_generate_Lou2022(mdata,matdata);
[plotData1_NewLou2022_sx_6,plotData1_NewLou2022_sy_6,plotData2_NewLou2022_sx_6,plotData2_NewLou2022_sy_6,plotData3_NewLou2022_6,plotData4_NewLou2022_6]...
    = Data_generate_NewLou2022(mdata,matdata);




figure
plot(plotData1_Lou2022_sx_1,plotData1_Lou2022_sy_1,'linewidth',1.0,'color','r');
hold on 
plot(plotData1_Lou2022_sx_2,plotData1_Lou2022_sy_2,'linewidth',1.0,'color','g');
plot(plotData1_Lou2022_sx_3,plotData1_Lou2022_sy_3,'linewidth',1.0,'color','b');
plot(plotData1_Lou2022_sx_4,plotData1_Lou2022_sy_4,'linewidth',1.0,'color','c');
plot(plotData1_Lou2022_sx_5,plotData1_Lou2022_sy_5,'linewidth',1.0,'color','m');
plot(plotData1_Lou2022_sx_6,plotData1_Lou2022_sy_6,'linewidth',1.0,'color','k');

plot(plotData1_NewLou2022_sx_1,plotData1_NewLou2022_sy_1,'--','linewidth',2.5,'color','r');
plot(plotData1_NewLou2022_sx_2,plotData1_NewLou2022_sy_2,'--','linewidth',2.5,'color','g');
plot(plotData1_NewLou2022_sx_3,plotData1_NewLou2022_sy_3,'--','linewidth',2.5,'color','b');
plot(plotData1_NewLou2022_sx_4,plotData1_NewLou2022_sy_4,'--','linewidth',2.5,'color','c');
plot(plotData1_NewLou2022_sx_5,plotData1_NewLou2022_sy_5,'--','linewidth',2.5,'color','m');
plot(plotData1_NewLou2022_sx_6,plotData1_NewLou2022_sy_6,'--','linewidth',2.5,'color','k');

set(gca, 'FontSize', 12,'FontName','Times New Roman');

xlabel('\sigma_{xx}','FontSize',16,'FontName','Times New Roman')
ylabel('\sigma_{yy}','FontSize',16,'FontName','Times New Roman')

legend1 =legend('','','','','','','(-3.375,0)','(2.25,0)','(0,1.299)','(0,-1.299)','(0.402,1.45)','(0.402,-1.45)');
set(legend1,'FontSize',12,'FontName','Times New Roman','Box','off')


 axis equal