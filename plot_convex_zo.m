clc
clear
close all 
load('Test_Lou2022.mat')
load('Test_Lou2022New.mat')
% load('Test_Lou2022_2.mat')
figure(1)
hold on
plot(c_limit,d_limit,'-r','linewidth',2)
plot(c_limit1,d_limit1,'--b','linewidth',1.5)
xlabel('c','FontSize',16,'FontName','Times New Roman')
ylabel('d','FontSize',16,'FontName','Times New Roman')
% axis equal


figure (2)
axes1 = axes('Position',[0.129901960784314 0.171086398631309 0.828703703703704 0.650769888793841]);
hold(axes1,'on');
plot1=plot(c_limit,d_limit,'-r','linewidth',2);
plot12=plot(c_limit1,d_limit1,'--b','linewidth',2.5);
% 创建 ylabel
ylabel('d','FontWeight','bold','FontName','Times New Roman');

% 创建 xlabel
xlabel('c','FontWeight','bold','FontName','Times New Roman');

% 取消以下行的注释以保留坐标区的 X 范围
xlim(axes1,[-4 3]);
% 取消以下行的注释以保留坐标区的 Y 范围
ylim(axes1,[-2 2]);
% % 设置其余坐标区属性
% set(axes1,'DataAspectRatio',[1 1 1],'FontName','Times New Roman','FontSize',...
%     12,'FontWeight','bold','PlotBoxAspectRatio',[3.5 2 1],'XAxisLocation',...
%     'origin','XTick',[-4 -3.5 -3 -2.5 -2 -1.5 -1 -0.5 0 0.5 1 1.5 2 2.5 3],...
%     'XTickLabel',...
%     {'-4','-3.5','-3','-2.5','-2','-1.5','-1','-0.5','0','0.5','1','1.5','2','2.5','3'},...
%     'YAxisLocation','origin');


legend1 =legend('Origin','Modify');
set(legend1,'FontSize',12,'FontName','Times New Roman','Box','off')



