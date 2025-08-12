function [] = myfunction( )
clc
clear
tol=1.0e-6;
inter=1; 
ifad=0:inter:360;
ifa=ifad*pi/180;
bitad=0:inter:180;
bita=bitad*pi/180;
n_ifa=length(ifa);
n_bita=length(bita);
delta_ifa=0.001/180*pi;
d_ifa=2;
for i=1:n_ifa
 for j=1:n_bita
 radius_u=50;
 radius_l=0;
 radius_m=(radius_u+radius_l)/2;
 dr=radius_u-radius_l;

 while dr>tol
 a=radius_m*sin(bita(j))*cos(ifa(i));
 b=radius_m*sin(bita(j))*sin(ifa(i));
 c=radius_m*cos(bita(j));
 param=[a b c];
 convex=1; %1 is for convex
 for l=0:d_ifa:360
 angld_A=l/180*pi;
 s1_A_try=2/3*cos(angld_A);
 s2_A_try=2/3*cos(2/3*pi-angld_A);
 s3_A_try=2/3*cos(4/3*pi-angld_A);
 f_A=Yldfunction(s1_A_try,s2_A_try,s3_A_try,param);
 s1_A=s1_A_try/f_A;
 s2_A=s2_A_try/f_A;
 s3_A=s3_A_try/f_A;
 
 angld_B=l/180*pi+delta_ifa;
 s1_B_try=2/3*cos(angld_B);
 s2_B_try=2/3*cos(2/3*pi-angld_B);
 s3_B_try=2/3*cos(4/3*pi-angld_B);
 f_B=Yldfunction(s1_B_try,s2_B_try,s3_B_try,param);
 s1_B=s1_B_try/f_B;
 s2_B=s2_B_try/f_B;
 s3_B=s3_B_try/f_B;
 
 s1_C=(s1_A+s1_B)/2;
 s2_C=(s2_A+s2_B)/2;
 s3_C=(s3_A+s3_B)/2;
 f_C=Yldfunction(s1_C,s2_C,s3_C,param);
 if f_C>1
 convex=0;
 break
 end
 end
 if convex==1
 radius_l=radius_m;
 else
 radius_u=radius_m;
 end
 radius_m=(radius_u+radius_l)/2;
 dr=(radius_u-radius_l)/2;
 end
 a_limit(i,j)=radius_m*sin(bita(j))*cos(ifa(i));
 b_limit(i,j)=radius_m*sin(bita(j))*sin(ifa(i));
 c_limit(i,j)=radius_m*cos(bita(j));
 end
end
mesh(a_limit,b_limit,c_limit);
end
function y=Yldfunction(s1,s2,s3,param)
a=param(1);
b=param(2);
c=param(3);
J2=-s1*s2-s2*s3-s1*s3;
J3=s1*s2*s3;
y=J2^(1/2)-a*J3/J2-b*J3^2/J2^(5/2)-c*J3^3/J2^4;
end