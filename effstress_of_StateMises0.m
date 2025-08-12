function [eff_sig] = effstress_of_StateMises0(Mdata,mdata,sig)

seta=[-2 -sqrt(3) -1  0 1  sqrt(3)  2 ];
Mf=[1 seta(1) seta(1)^2 seta(1)^3 seta(1)^4 seta(1)^5 seta(1)^6;
    1 seta(2) seta(2)^2 seta(2)^3 seta(2)^4 seta(2)^5 seta(2)^6;
    1 seta(3) seta(3)^2 seta(3)^3 seta(3)^4 seta(3)^5 seta(3)^6;
    1 seta(4) seta(4)^2 seta(4)^3 seta(4)^4 seta(4)^5 seta(4)^6;
    1 seta(5) seta(5)^2 seta(5)^3 seta(5)^4 seta(5)^5 seta(5)^6;
    1 seta(6) seta(6)^2 seta(6)^3 seta(6)^4 seta(6)^5 seta(6)^6
    1 seta(7) seta(7)^2 seta(7)^3 seta(7)^4 seta(7)^5 seta(7)^6];
sigref=Mdata.sigT00;
sigUT=Mdata.sigUT;
sigPST=Mdata.sigPST;
sigPSC=Mdata.sigPSC;
sigBT=Mdata.sigBT;
sigBC=Mdata.sigBC;
sigUC=Mdata.sigUC;
sigSS=Mdata.sigSS;
rightTemp(1)=sigref/sigBC;
rightTemp(2)=sigref/(sigPSC*sqrt(3)/2);
rightTemp(3)=sigref/sigUC;
rightTemp(4)=sigref/(sigSS*sqrt(3));
rightTemp(5)=sigref/(sigUT);
rightTemp(6)=sigref/(sigPST*sqrt(3)/2);
rightTemp(7)=sigref/(sigBT);
faeta=Mf\rightTemp';
eta=(sig.xx+sig.yy)/(MisesPlaneStress(sig));
sigvm=MisesPlaneStress(sig);
f_eta=faeta(1)+faeta(2)*eta+faeta(3)*eta^2+faeta(4)*eta^3+faeta(5)*eta^4+faeta(6)*eta^5+faeta(7)*eta^6;
eff_sig=f_eta*sigvm;

end

function [effstress] = MisesPlaneStress(sig)

effstress=sqrt(sig.xx^2+sig.yy^2-sig.xx*sig.yy+3*sig.xy^2);


end

