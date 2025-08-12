function [convex] = convex_Test_plot3D_for_AsymYld91(Matdata,sigref,yieldType,isplot)

convex=1;

Tmod=1;
Cmod=1;


[mdata.Tp1 ,mdata.Tp2,mdata.Tp3,mdata.Tp4,Tmod] = ...
get_factor_mod(Matdata.Txy00 ,Matdata.Txy45 ,Matdata.Txy90 ,Matdata.TEB,yieldType);

[mdata.Cp1 ,mdata.Cp2,mdata.Cp3,mdata.Cp4,Cmod] = ...
get_factor_mod(Matdata.Cxy00 ,Matdata.Cxy45 ,Matdata.Cxy90 ,Matdata.CEB,yieldType);


if(Tmod==0||Cmod==0)
    convex=0;
    return
end
Txy00=Matdata.Txy00;
Cxy00=Matdata.Cxy00;

delta_ifa=0.001/180*pi;
alpha=0:0.1:360;
beita=-90:0.1:90;
alpha=alpha.*(pi/180);
beita=beita.*(pi/180);
alphac=zeros(360*180,1);
beitac=zeros(360*180,1);
num_cve=0;
for is=1:length(alpha)
    for js=1:length(beita)
        if1=alpha(is);
        bt1=beita(js);
        % 第一个点
        sig_1_try.xx=cos(bt1)*cos(if1);
        sig_1_try.yy=cos(bt1)*sin(if1);
        sig_1_try.xy=sin(bt1);
        f_A=yield_stress(mdata,sig_1_try,Txy00,Cxy00,yieldType);
        sig_1.xx= sig_1_try.xx/f_A;
        sig_1.yy= sig_1_try.yy/f_A;
        sig_1.xy= sig_1_try.xy/f_A;
        % 2
        sig_2_try.xx=cos(bt1+delta_ifa)*cos(if1);
        sig_2_try.yy=cos(bt1+delta_ifa)*sin(if1);
        sig_2_try.xy=sin(bt1+delta_ifa);
        f_2=yield_stress(mdata,sig_2_try,Txy00,Cxy00,yieldType);
        sig_2.xx= sig_2_try.xx/f_2;
        sig_2.yy= sig_2_try.yy/f_2;
        sig_2.xy= sig_2_try.xy/f_2;
        % 3
        sig_3_try.xx=cos(bt1)*cos(if1+delta_ifa);
        sig_3_try.yy=cos(bt1)*sin(if1+delta_ifa);
        sig_3_try.xy=sin(bt1);
        f_3=yield_stress(mdata,sig_3_try,Txy00,Cxy00,yieldType);
        sig_3.xx= sig_3_try.xx/f_3;
        sig_3.yy= sig_3_try.yy/f_3;
        sig_3.xy= sig_3_try.xy/f_3;
        %centr
        sigm.xx=(sig_1.xx+sig_2.xx+sig_3.xx)/3;
        sigm.yy=(sig_1.yy+sig_2.yy+sig_3.yy)/3;
        sigm.xy=(sig_1.xy+sig_2.xy+sig_3.xy)/3;
        
        fm=yield_stress(mdata,sigm,Txy00,Cxy00,yieldType);
        if fm>1
            num_cve=num_cve+1;
            convex=0;
            alphac(num_cve)=if1;
            beitac(num_cve)=bt1;
             if isplot==0
                 break
             end
        end
    end
end
%plot

Sxx=[];
Syy=[];
Sxy=[];
ifa=1:3:363;
bet=-90:3:90;
sig_ref=sigref;

%% x-y plane
for is=1:length(ifa)
    for js=1:length(bet)
        alp=ifa(is)/180*pi;
        bta=bet(js)/180*pi;
        sig.xx=cos(bta)*cos(alp);
        sig.yy=cos(bta)*sin(alp);
        sig.xy=sin(bta);
%         [fy_try] = eff_stress_AnalyYoon(param,sigxx_try ,sigyy_try ,0, sigxy_try, 0 ,0);
        
        fy_try=yield_stress(mdata,sig,Txy00,Cxy00,yieldType);
        r_radus=sig_ref/fy_try;
%         sigxx=sigxx_try/fy_try*sig_ref;
%         sigyy=sigyy_try/fy_try*sig_ref;
%         sigxy=sigxy_try/fy_try*sig_ref;
        Sxx(is,js)=r_radus*cos(bta)*cos(alp);
        Syy(is,js)=r_radus*cos(bta)*sin(alp);
        Sxy(is,js)=r_radus*sin(bta);
    end
end

if isplot==1
figure
s2=surf(Sxx,Syy,Sxy,'FaceAlpha','0.5','FaceColor',mcolor(6));
hold on;
xlabel('{\sigma}_{xx}','FontSize',12,'FontName','Times New Roman')
ylabel('{\sigma}_{yy}','FontSize',12,'FontName','Times New Roman')
zlabel('{\sigma}_{xy}','FontSize',12,'FontName','Times New Roman')
if convex==0
    for covid=1:num_cve
        alp=alphac(covid);
        bta=beitac(covid);
        sig.xx=cos(bta)*cos(alp);
        sig.yy=cos(bta)*sin(alp);
        sig.xy=sin(bta);
        fy_try=yield_stress(mdata,sig,Txy00,Cxy00,yieldType);
        r_radus=sig_ref/fy_try;
        plot3(r_radus*sig.xx,r_radus*sig.yy,r_radus*sig.xy,'.','markersize',15,'color','r')
        
    end
end
axis equal
end
hold off;
end

    
    function [sigbar] = yield_stress(MatData,sig,Txy00,Cxy00,m)
    
    sigbar=effect_stress_of_asymYld91_mdata(MatData,sig,Txy00,Cxy00,m);
    end
    
    
    
    
    
function [iRGB] = mcolor(id)
mcolormap=[ 0, 47, 167; % 1
0, 140, 140; % 2
144, 0, 33; % 3
230, 0, 0; % 4
232, 88, 39; % 5
129, 216, 208; % 6
176, 89, 35;]./255; % 7
if id<=7
iRGB = mcolormap(id,:);
else
iRGB = [0,0,0];
end
end