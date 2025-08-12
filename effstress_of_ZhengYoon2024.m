function [eff_sig] = effstress_of_ZhengYoon2024(Mdata,mdata,sig,type)
%A flexible yield criterion for strength modeling from biaxial 
%compression to biaxial tension

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

sigPST22=0.5*sigPST;
g=0.5*(1-sigT00/sigC00);
h=0.5*(sigT00/sigT90-sigT00/sigC90);
j=(1-g)*(1-g);
k=0.25*(sigT00/sigT90+sigT00/sigC90)^2;
l=j+k-(sigT00/sigBT-g-h)^2;
m=(2*sigT00/sigT45-g-h)^2-(j+k-l);
a=1/(g-h+sqrt(j+k+l))*sigT00/sigSS;
b=1/(6*a)+1/(6*a*(g+h-sqrt(j+k-l)))*sigT00/sigBC;
d=-b/2-1/(6*a*(2*g+h+sqrt(4*j+k-2*l)))*sigT00/sigPST22+(sqrt(3)*b+1)/6;
c=-b-5*d;
e=1/a-(1+1.5*b+2.5*c+8.5*d);
f=0.5*b+1.5*c+7.5*d;

f_sigH=g*sig.xx+h*sig.yy+sqrt(j*sig.xx^2+k*sig.yy^2-l*sig.xx*sig.yy+m*sig.xy^2);

eta=(sig.xx+sig.yy)/(MisesPlaneStress(sig)*3);
ksi=normalizedThird(sig);
f_etaksi=a*(1+3*b*eta+9*c*eta^2+81*d*eta^4+e*ksi^2+f*ksi);





eff_sig=f_etaksi*f_sigH;
% 
% eff_sig= f_sigH;


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



