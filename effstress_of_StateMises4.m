function [eff_sig] = effstress_of_StateMises4(Mdata,mdata,sig)

%   UT PST EBT
% seta=[-2/3 -1/3 0 1/3 sqrt(3)/3 2/3];

seta=[  1  sqrt(3)  2 ];


seta=[  1  sqrt(3)  2 ];
Mf=[1  seta(1)^2  seta(1)^4 ;
    1  seta(2)^2  seta(2)^4 ;
    1  seta(3)^2  seta(3)^4 ];
sigref=Mdata.sigT00;
sigUT=Mdata.sigUT;
sigPST=Mdata.sigPST;
sigBT=Mdata.sigBT;
sigBC=Mdata.sigBC;
sigUC=Mdata.sigUC;
sigSS=Mdata.sigSS;

rightTemp(1)=sigref/(sigUT);
rightTemp(2)=sigref/(sigPST*sqrt(3)/2);
rightTemp(3)=sigref/(sigBT);
faeta=Mf\rightTemp';
eta=(sig.xx+sig.yy)/(MisesPlaneStress(sig));
sigvm=MisesPlaneStress(sig);
f_eta=faeta(1)+faeta(2)*eta^2+faeta(3)*eta^4;
eff_sig=f_eta*sigvm;


end


















function [effstress] = MisesPlaneStress(sig)

effstress=sqrt(sig.xx^2+sig.yy^2-sig.xx*sig.yy+3*sig.xy^2);


end