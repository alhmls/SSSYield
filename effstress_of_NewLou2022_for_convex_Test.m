function [eff_sig] = effstress_of_NewLou2022_for_convex_Test(mdata,sig)
% A general yield function with differential and anisotropic 
% hardening for strength modelling under various stress states with 
% non-associated flow rule 

a=mdata.a;
b=mdata.b;
c=mdata.c;
d=mdata.d;

sigVm=MisesPlaneStress(sig);

eta=(sig.xx+sig.yy)/(sigVm*3);
etab=3*eta;

pksi=1.5*etab-0.5*etab^3;
pksi2=2.25*etab^2-1.5*etab^4+0.25*etab^6;
% ksi=normalizedThird(sig);

f_etaksi=a*(3*b*eta+1/3*((27-4*c*pksi2)^(1/2)-2*d*pksi)^(1/3));


eff_sig=f_etaksi*sigVm;


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