function [convex] = convex_Test_for_Lou2022(mdata,sigref,yieldType,isplot)

convex=1;
 
calType=0;
MatDate.Txy00=1;
Txy00=sigref;
Cxy00=1;

delta_ifa=0.01/180*pi;
alpha=0:0.1:360;
beita=-90:1:90;
alpha=alpha.*(pi/180);
beita=beita.*(pi/180);
alphac=zeros(360*180*10,1);
beitac=zeros(360*180*10,1);
num_cve=0;
for is=1:length(alpha)
    if convex==0&&isplot==0
        break;
    end
    for js=1:length(beita)
        if1=alpha(is);
        bt1=beita(js);
        % 第一个点
        sig_1_try.xx=cos(bt1)*cos(if1);
        sig_1_try.yy=cos(bt1)*sin(if1);
        sig_1_try.xy=sin(bt1);
        f_A=yield_stress(MatDate,mdata,sig_1_try,calType,yieldType);
        sig_1.xx= sig_1_try.xx/f_A;
        sig_1.yy= sig_1_try.yy/f_A;
        sig_1.xy= sig_1_try.xy/f_A;
        % 2
        sig_2_try.xx=cos(bt1+delta_ifa)*cos(if1);
        sig_2_try.yy=cos(bt1+delta_ifa)*sin(if1);
        sig_2_try.xy=sin(bt1+delta_ifa);
        f_2=yield_stress(MatDate,mdata,sig_2_try,calType,yieldType);
        sig_2.xx= sig_2_try.xx/f_2;
        sig_2.yy= sig_2_try.yy/f_2;
        sig_2.xy= sig_2_try.xy/f_2;
        % 3
        sig_3_try.xx=cos(bt1)*cos(if1+delta_ifa);
        sig_3_try.yy=cos(bt1)*sin(if1+delta_ifa);
        sig_3_try.xy=sin(bt1);
        f_3=yield_stress(MatDate,mdata,sig_3_try,calType,yieldType);
        sig_3.xx= sig_3_try.xx/f_3;
        sig_3.yy= sig_3_try.yy/f_3;
        sig_3.xy= sig_3_try.xy/f_3;
        %centr
        sigm.xx=(sig_1.xx+sig_2.xx+sig_3.xx)/3;
        sigm.yy=(sig_1.yy+sig_2.yy+sig_3.yy)/3;
        sigm.xy=(sig_1.xy+sig_2.xy+sig_3.xy)/3;
        
        fm=yield_stress(MatDate,mdata,sigm, calType,yieldType);
        if fm>1&& isplot==0
            convex=0;
            break
        end
        if fm>1
            num_cve=num_cve+1;
            convex=0;
            alphac(num_cve)=if1;
            beitac(num_cve)=bt1;
        end
    end
end


% %plot
if isplot==1
Sxx=[];
Syy=[];
Sxy=[];
ifa=1:3:363;
bet=-90:3:90;
sig_ref=sigref;

for is=1:length(ifa)
    for js=1:length(bet)
        alp=ifa(is)/180*pi;
        bta=bet(js)/180*pi;
        sig.xx=cos(bta)*cos(alp);
        sig.yy=cos(bta)*sin(alp);
        sig.xy=sin(bta);

        fy_try=yield_stress(MatDate,mdata,sig, calType,yieldType);
        r_radus=sig_ref/fy_try;
%         sigxx=sigxx_try/fy_try*sig_ref;
%         sigyy=sigyy_try/fy_try*sig_ref;
%         sigxy=sigxy_try/fy_try*sig_ref;
        Sxx(is,js)=r_radus*cos(bta)*cos(alp);
        Syy(is,js)=r_radus*cos(bta)*sin(alp);
        Sxy(is,js)=r_radus*sin(bta);
    end
end

if convex==0||convex==1
figure
% s2=surf(Sxx,Syy,Sxy,'FaceAlpha','0.5','FaceColor',mcolor(6));
s2=surf(Sxx,Syy,Sxy,'FaceAlpha','0.4');
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
        fy_try=yield_stress(MatDate,mdata,sig,calType,yieldType);
        r_radus=sig_ref/fy_try;
        plot3(r_radus*sig.xx,r_radus*sig.yy,r_radus*sig.xy,'.','markersize',15,'color','r')
        
    end
end
axis equal


hold off;
end
end



end

    
function [sigbar] = yield_stress(MatData,mdata,sig,calType,yieldType)
    
m=yieldType;

if m==1
    sigbar=effstress_of_StateMises(MatData,mdata,sig);
elseif m==2
    sigbar=effstress_of_StateMises2(MatData,mdata,sig);
elseif m==3
    sigbar=effstress_of_StateMises3(MatData,mdata,sig);
elseif m==4
    sigbar=effstress_of_StateMises4(MatData,mdata,sig);
elseif m==5
    sigbar=effstress_of_StateMises5(MatData,mdata,sig);
elseif m==-1
    sigbar=effstress_of_StateAsymHill_2(MatData,mdata,sig,0);
elseif m==-2
    sigbar=effstress_of_StateAsymHill(MatData,mdata,sig,0);
elseif m==-3
    sigbar=effstress_of_ZhengYoon2024(MatData,mdata,sig,0);
elseif m==-4
    sigbar=effstress_of_ZhangLou2024(MatData,mdata,sig,0);
elseif m==-5
    sigbar=effstress_of_Hou2023(MatData,mdata,sig,0);
elseif m==-6
    sigbar=effstress_of_ZhangLou2023(MatData,mdata,sig,0);
elseif m==-7
    sigbar=effstress_of_Lou2022_for_convex_Test(mdata,sig);
elseif m==-8
    sigbar=effstress_of_NewLou2022_for_convex_Test(mdata,sig);
else
    sigbar=effstress_of_StateMisesC(MatData,mdata,sig);
end
    
%     sigbar=effect_stress_of_Hosford(sig,m);
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