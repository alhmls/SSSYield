function [Rtheta] = Rvalue_potntial_mdata(RT00,RT45,RT90,sig,Theta)

the=Theta*pi/180;


 Tlam=(1+1/RT90)/(1+1/RT00);
 Tnu=(1)/(1+1/RT00);
 
 Trho=(2*RT45+1)*(1/RT00+1/RT90)/(2*(1+1/RT00));
 
 efsigT=sqrt(sig.xx^2+Tlam*sig.yy^2-2*Tnu*sig.xx*sig.yy+2*Trho*sig.xy^2);
 
dsigxx=2*sig.xx-2*Tnu*sig.yy;
dsigyy=2*Tlam*sig.yy-2*Tnu*sig.xx;
dsigxy=4*Trho*sig.xy;

Rtheta=-(dsigxx*sin(the)^2+dsigyy*cos(the)^2-dsigxy*sin(the)*cos(the))/(dsigxx+dsigyy);


end