function [ ] = plot_potential_hill(RT00,RT45, RT90,RC00,RC45,RC90,Txy00,Cxy00)


% RT00=1.21738 ;
% RT45=2.89281;
% RT90=1.58306;
% 
% 
% RC00=1.25855 ;
% RC45=0.84756 ;
% RC90=1.35692;

theta= linspace(0,90,1000);
for i=1:length(theta)
    the=theta(i);
    sig.xx=cos(the*pi/180)*cos(the*pi/180);
    sig.yy=sin(the*pi/180)*sin(the*pi/180);
    sig.xy=cos(the*pi/180)*sin(the*pi/180);
    
    [Rtheta(i)] = Rvalue_potntial_mdata(RT00,RT45,RT90,sig,the);
end

figure
plot(theta,Rtheta,'linewidth',2,'color','b');
hold on
for i=1:length(theta)
    the=theta(i);
    sig.xx=cos(the*pi/180)*cos(the*pi/180);
    sig.yy=sin(the*pi/180)*sin(the*pi/180);
    sig.xy=cos(the*pi/180)*sin(the*pi/180);
    
    [Rtheta(i)] = Rvalue_potntial_mdata(RC00,RC45,RC90,sig,the);
end
plot(0,RT00,'d','MarkerFaceColor','b','MarkerEdgeColor','b','markersize',7)
plot(theta,Rtheta,'linewidth',2,'color','r');
plot(0,RC00,'s','MarkerFaceColor','r','MarkerEdgeColor','r','markersize',7)
plot(45,RT45,'d','MarkerFaceColor','b','MarkerEdgeColor','b','markersize',7)
plot(90,RT90,'d','MarkerFaceColor','b','MarkerEdgeColor','b','markersize',7)

plot(45,RC45,'s','MarkerFaceColor','r','MarkerEdgeColor','r','markersize',7)
plot(90,RC90,'s','MarkerFaceColor','r','MarkerEdgeColor','r','markersize',7)
set(gca, 'FontSize', 14,'FontName','Times New Roman');

xlabel('Loading direction','FontSize',14,'FontName','Times New Roman')
ylabel('R value','FontSize',14,'FontName','Times New Roman')
legend1 =legend("UT","Exp. UT","UC","Exp. UC");
set(legend1,'FontSize',12,'Box','off','FontName','Times New Roman')
box off
hold off

Sxx=[];
Syy=[];
Sxy=[];
ifa=1:3:363;
bet=-90:3:90;
sig_ref=1;


for is=1:length(ifa)
    for js=1:length(bet)
        alp=ifa(is)/180*pi;
        bta=bet(js)/180*pi;
        sig.xx=cos(bta)*cos(alp);
        sig.yy=cos(bta)*sin(alp);
        sig.xy=sin(bta);
%         [fy_try] = eff_stress_AnalyYoon(param,sigxx_try ,sigyy_try ,0, sigxy_try, 0 ,0);
        
        fy_try=effect_stress_of_potntial_mdata(RT00,RT45,RT90,RC00,RC45,RC90,Txy00,Cxy00,sig);
        r_radus=sig_ref/fy_try;
%         sigxx=sigxx_try/fy_try*sig_ref;
%         sigyy=sigyy_try/fy_try*sig_ref;
%         sigxy=sigxy_try/fy_try*sig_ref;
        Sxx(is,js)=r_radus*cos(bta)*cos(alp);
        Syy(is,js)=r_radus*cos(bta)*sin(alp);
        Sxy(is,js)=r_radus*sin(bta);
    end
end
figure (101) 
% s2=surf(Sxx,Syy,Sxy,'FaceAlpha','0.5','FaceColor',mcolor(6));
s2=surf(Sxx,Syy,Sxy,'FaceAlpha','0.5');
xlabel('{\sigma}_{xx}','FontSize',20,'FontName','Times New Roman')
ylabel('{\sigma}_{yy}','FontSize',20,'FontName','Times New Roman')
zlabel('{\sigma}_{xy}','FontSize',20,'FontName','Times New Roman')
hold on 
plot3(0,0,0,'.','color','b','markersize',30)
axis equal



poleAngle=0:0.1:360;
sx=[];
sy=[];
sx2=[];
sy2=[];
for i=1:length(poleAngle)
    angle=poleAngle(i)*pi/180;
    sig.xx=cos(angle);
    sig.yy=sin(angle);
    sig.xy=0;
    dnom=effect_stress_of_potntial_mdata(RT00,RT45,RT90,RC00,RC45,RC90,Txy00,Cxy00,sig);
    xnom=1/dnom;
    sx(i)=sig.xx*xnom;
    sy(i)=sig.yy*xnom;
end
for i=1:length(poleAngle)
    angle=poleAngle(i)*pi/180;
    sig.xx=cos(angle);
    sig.yy=sin(angle);
    sig.xy=0;
    dnom=effect_stress_of_potntial_mdata2(RT00,RT45,RT90,RC00,RC45,RC90,Txy00,Cxy00,sig);
    xnom=1/dnom;
    sx2(i)=sig.xx*xnom;
    sy2(i)=sig.yy*xnom;
end

figure (100) 
plot(sx,sy,'linewidth',1,'color','r');
hold on
plot(sx2,sy2,'--','linewidth',1,'color','b');
hl=legend("Proposed potential function","LAA-Hill48");
set(hl,'Box','off');

set(gca, 'FontSize', 12,'FontName','Times New Roman');
xlabel('\sigma_{xx}','FontSize',20,'FontName','Times New Roman')
ylabel('\sigma_{yy}','FontSize',20,'FontName','Times New Roman')
hold on
box on
axis equal

end


function [sig_bar] = effect_stress_of_potntial_mdata2(RT00,RT45,RT90,RC00,RC45,RC90,Txy00,Cxy00,sig)
 
k=1.2;


 Tlam=(1+1/RT90)/(1+1/RT00);
 Tnu=(1)/(1+1/RT00);
 
 Trho=(2*RT45+1)*(1/RT00+1/RT90)/(2*(1+1/RT00));
 
 efsigT=sqrt(sig.xx^2+Tlam*sig.yy^2-2*Tnu*sig.xx*sig.yy+2*Trho*sig.xy^2);
 
 Clam=(1+1/RC90)/(1+1/RC00);
 Cnu=(1)/(1+1/RC00);
 
 Crho=(2*RC45+1)*(1/RC00+1/RC90)/(2*(1+1/RC00));
 
 efsigC=sqrt(sig.xx^2+Clam*sig.yy^2-2*Cnu*sig.xx*sig.yy+2*Crho*sig.xy^2);
 
 eta=(sig.xx+sig.yy)/(3*MisesPlaneStress(sig));
 
 ksi=normalizedThird(sig);

% g=g_poly5(eta,k);
% g=g_sin(eta);
g=(normalizedThird(sig)+1)/2;

sig_bar=g*efsigT+(1-g)*efsigC*Txy00/Cxy00;
 
 
 
end


function [sig_bar] = effect_stress_of_potntial_mdata(RT00,RT45,RT90,RC00,RC45,RC90,Txy00,Cxy00,sig)
 
k=1.2;


 Tlam=(1+1/RT90)/(1+1/RT00);
 Tnu=(1)/(1+1/RT00);
 
 Trho=(2*RT45+1)*(1/RT00+1/RT90)/(2*(1+1/RT00));
 
 efsigT=sqrt(sig.xx^2+Tlam*sig.yy^2-2*Tnu*sig.xx*sig.yy+2*Trho*sig.xy^2);
 
 Clam=(1+1/RC90)/(1+1/RC00);
 Cnu=(1)/(1+1/RC00);
 
 Crho=(2*RC45+1)*(1/RC00+1/RC90)/(2*(1+1/RC00));
 
 efsigC=sqrt(sig.xx^2+Clam*sig.yy^2-2*Cnu*sig.xx*sig.yy+2*Crho*sig.xy^2);
 
 eta=(sig.xx+sig.yy)/(3*MisesPlaneStress(sig));
 
 ksi=normalizedThird(sig);

% g=g_poly5(eta,k);
g=g_sin(eta);
% g=(normalizedThird(sig)+1)/2;

sig_bar=g*efsigT+(1-g)*efsigC*Txy00/Cxy00;
 
 
 
end
 
function effstress=cal_J2(sig)
effstress=(sig.xx^2+sig.yy^2-sig.xx*sig.yy)/3+sig.xy^2;
end

function effstress=cal_J3(sig)
effstress=2/27*(sig.xx^3+sig.yy^3)-1/9*sig.xx*sig.yy*(sig.xx+sig.yy)+1/3*sig.xy^2*(sig.xx+sig.yy);
end

function ksi=normalizedThird(sig)
J2=cal_J2(sig);
J3=cal_J3(sig);
ksi=3*sqrt(3)*J3/(2*J2^(1.5));

end

function [effstress] = MisesPlaneStress(sig)
effstress=sqrt(sig.xx^2+sig.yy^2-sig.xx*sig.yy+3*sig.xy^2);
end
function [g] = g_sin(eta)
% if(eta>1/3)
%     g=1;
% elseif(eta<-1/3)
%     g=0;
% else
% etab=3*eta;
% g=0.5*sin(pi/2*etab)+0.5;
% end
etab=3*eta;
g=0.5*sin(pi/2*etab)+0.5;
end

function [g] = g_poly5(eta,k)
if(eta>1/3)
    g=1;
elseif(eta<-1/3)
    g=0;
else
    mu5=729/2*(2/9*k-0.5);
    mu3=-3*k-5/27*mu5;
    mu1=k;
    mu0=0.5;
    
    g=mu5*eta^5+mu3*eta^3+mu1*eta+mu0;
end
% 
%     mu5=729/2*(2/9*k-0.5);
%     mu3=-3*k-5/27*mu5;
%     mu1=k;
%     mu0=0.5;
%     
%     g=mu5*eta^5+mu3*eta^3+mu1*eta+mu0;

end












