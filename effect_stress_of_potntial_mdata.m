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
 

g=g_sin(eta);

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







