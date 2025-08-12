clear 
clc
tol=1.0e-4;

checkFunction=1;%  检测 ksi 被代替的屈服函数
% checkFunction=0;%  检测 ksi 未被代替的屈服函数

if checkFunction==0
    %%  检测 ksi 未被代替的屈服函数
mdata.a=1;
mdata.b=0;
poleAngle=0:1:360;
c_limit=zeros(length(poleAngle),1);
d_limit=zeros(length(poleAngle),1);
for i=1:length(poleAngle)
 angel=poleAngle(i)*pi/180;
 radius_u=4;
 radius_l=0.75;
 radius_m=(radius_u+radius_l)/2;
 dr=radius_u-radius_l;
 
 while dr>tol
     mdata.c=radius_m*cos(angel);
     mdata.d=radius_m*sin(angel);
     convex=1;
     convex=convex_Test_for_Lou2022(mdata,1.0,-7,0);
     if convex==1
        radius_l=radius_m;
     else
        radius_u=radius_m;
     end
     radius_m=(radius_u+radius_l)/2;
     dr=(radius_u-radius_l)/2;
 end
 c_limit(i)=radius_m*cos(angel);
 d_limit(i)=radius_m*sin(angel);
end
figure
plot(c_limit,d_limit,'linewidth',2);


else
%%  检测 ksi 被代替的屈服函数
mdata.a=1;
mdata.b=0;
poleAngle=0:1:360;
c_limit1=zeros(length(poleAngle),1);
d_limit1=zeros(length(poleAngle),1);
for i=1:length(poleAngle)
 angel=poleAngle(i)*pi/180;
 radius_u=5;
 radius_l=0;
 radius_m=(radius_u+radius_l)/2;
 dr=radius_u-radius_l;
 
 while dr>tol
     mdata.c=radius_m*cos(angel);
     mdata.d=radius_m*sin(angel);
     convex=1;
     convex=convex_Test_for_Lou2022(mdata,1.0,-8,0);
     if convex==1
        radius_l=radius_m;
     else
        radius_u=radius_m;
     end
     radius_m=(radius_u+radius_l)/2;
     dr=(radius_u-radius_l)/2;
 end
 c_limit1(i)=radius_m*cos(angel);
 d_limit1(i)=radius_m*sin(angel);
end
figure
plot(c_limit1,d_limit1,'linewidth',2);   
end
    
    
    
    
    
    
    