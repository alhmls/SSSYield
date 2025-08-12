clear
clc
close all
%%  anali
% 1=0;
ksim=-1:0.0001:1;

for i=1:length(ksim)
    ksi=ksim(i);
    theta=acos(ksi)/3;
   etam1(i)=-2/3*cos(theta)*3; 
   etam2(i)=-2/3*cos(2/3*pi-theta)*3;
   etam3(i)=-2/3*cos(4/3*pi-theta)*3; 
end

a=-3:0.0001:3;
b=zeros(1,length(a));




etam_=[etam1 etam2 etam3];
ksim_=[ksim ksim ksim];
figure
hold on 
plot(etam3,ksim,"b","linewidth",1.);
plot(etam2,ksim,"b","linewidth",1.,'HandleVisibility', 'off');
plot(etam1,ksim,"b","linewidth",1.,'HandleVisibility', 'off');

plot(a,b,"-.g","linewidth",0.5,'HandleVisibility', 'off');
set(gca, 'FontSize', 12,'FontName','Times New Roman');
xlim([-3 3]);
ylim([-1.2 1.2]);

ylabel('\xi','FontWeight','bold','FontSize',16,...
    'FontName','Times New Roman');

xlabel('$\overline{\eta}$', 'Interpreter', 'latex','FontWeight','bold','FontSize',16,...
    'FontName','Times New Roman');
%%
MB=[1 1 1;sqrt(3) 3*sqrt(3) 9*sqrt(3);2 8 32];
rb=[1 0 -1]';
bm=MB\rb;

etam=-2:0.0001:2;
for i=1:length(etam)
    etab=etam(i);
    f_ksi_eta(i)=(bm(1)*etab+bm(2)*etab^3+bm(3)*etab^5);
end
% figure
plot(etam,f_ksi_eta,"--r","linewidth",2);
hold on
plot(-2,1,'d','MarkerFaceColor','k','MarkerEdgeColor','k','markersize',6,'HandleVisibility', 'off');
plot(-sqrt(3),0,'d','MarkerFaceColor','k','MarkerEdgeColor','k','markersize',6,'HandleVisibility', 'off');
plot(-1,-1,'d','MarkerFaceColor','k','MarkerEdgeColor','k','markersize',6,'HandleVisibility', 'off');
plot(0,0,'d','MarkerFaceColor','k','MarkerEdgeColor','k','markersize',6,'HandleVisibility', 'off');
plot( 2,-1,'d','MarkerFaceColor','k','MarkerEdgeColor','k','markersize',6,'HandleVisibility', 'off');
plot( sqrt(3),0,'d','MarkerFaceColor','k','MarkerEdgeColor','k','markersize',6,'HandleVisibility', 'off');
plot( 1, 1,'d','MarkerFaceColor','k','MarkerEdgeColor','k','markersize',6,'HandleVisibility', 'off');
legend1 =legend('Analytical solution','Polynomial function');
set(legend1,'FontSize',12,'Box','off','FontName','Times New Roman')
box on;
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


figure 
hold on 
plot(ksim,etam3,"b","linewidth",1.);
plot(ksim,etam2,"b","linewidth",1.,'HandleVisibility', 'off');
plot(ksim,etam1,"b","linewidth",1.,'HandleVisibility', 'off');

plot(1,-2,'d','MarkerFaceColor','k','MarkerEdgeColor','k','markersize',6,'HandleVisibility', 'off');
plot(0,-sqrt(3),'d','MarkerFaceColor','k','MarkerEdgeColor','k','markersize',6,'HandleVisibility', 'off');
plot(-1,-1,'d','MarkerFaceColor','k','MarkerEdgeColor','k','markersize',6,'HandleVisibility', 'off');
plot(0,0,'d','MarkerFaceColor','k','MarkerEdgeColor','k','markersize',6,'HandleVisibility', 'off');
plot( -1,2,'d','MarkerFaceColor','k','MarkerEdgeColor','k','markersize',6,'HandleVisibility', 'off');
plot( 0,sqrt(3),'d','MarkerFaceColor','k','MarkerEdgeColor','k','markersize',6,'HandleVisibility', 'off');
plot( 1, 1,'d','MarkerFaceColor','k','MarkerEdgeColor','k','markersize',6,'HandleVisibility', 'off');
plot(b,a,"-.r","linewidth",0.5,'HandleVisibility', 'off');
set(gca, 'FontSize', 12,'FontName','Times New Roman');

xlabel('\xi','FontWeight','bold','FontSize',16,...
    'FontName','Times New Roman');
ylabel('$\overline{\eta}$', 'Interpreter', 'latex','FontWeight','bold','FontSize',16,...
    'FontName','Times New Roman');
ylim([-3 3]);
xlim([-1.2 1.2]);
box on



