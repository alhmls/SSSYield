function [eff_sig] = effstress_of_ZhangLou2024(Mdata,mdata,sig,type)
%Influences of the evolving plastic behavior of sheet metal on 
%V-bending and springback analysis considering different 
%stress states

sigT00=Mdata.sigT00;
sigT45=Mdata.sigT45;
sigT90=Mdata.sigT90;
sigTB=Mdata.sigBT;
sigC00=Mdata.sigC00;
sigC45=Mdata.sigC45;
sigC90=Mdata.sigC90;

sigref=Mdata.sigT00;
sigUT=Mdata.sigUT;
sigPST=Mdata.sigPST;
sigBT=Mdata.sigBT;
sigBC=Mdata.sigBC;
sigUC=Mdata.sigUC;
sigSS=Mdata.sigSS;

sigPST_mises=sigPST*sqrt(3)/2;

f_SY2009=sqrt((sig.xx/sigT00^2-sig.yy/sigT90^2)*(sig.xx-sig.yy)+(sig.xx*sig.yy-sig.xy*sig.xy)/sigTB^2+4*sig.xy^2/sigT45^2);

SY2009_SS=sqrt(2/sigT00^2+2/sigT90^2-1/sigTB^2)*sigSS ;
SY2009_PST=sqrt((2/sigT00^2-1/sigT90^2+2/sigTB^2)/3)*sigPST_mises ;


a=sqrt(3)/SY2009_SS;
c=(3^8-(1/a*(1.5-sigBT/(2*sigBC)+2*sigT00/sigC00))^16)/(4*3^5);
b=1/a-1/3*(3^8-4*3^5*c)^(1/16);
b2=1/(2*a*b)*(sigBT/sigBC-sigT00/sigC00);
b1=7/6-2/9*b2;
b3=-(1.5+b2);


eta=(sig.xx+sig.yy)/(MisesPlaneStress(sig)*3);
ksi=normalizedThird(sig);

p_eta=b1*eta+b2*eta^2+b3*eta^3;

f_etaksi=a*(3*b*p_eta+1/3*(3^8-4*3^5*c*ksi^2)^(1/16));

eff_sig=f_etaksi*f_SY2009*sigT00;


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