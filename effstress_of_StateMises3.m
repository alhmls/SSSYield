function [eff_sig] = effstress_of_StateMises3(Mdata,mdata,sig)

%  SS UT PST EBT
% seta=[-2/3 -1/3 0 1/3 sqrt(3)/3 2/3];

seta=[  0 1  sqrt(3)  2 ];


seta=[  0 1  sqrt(3)  2 ];
Mf=[1  seta(1)^1  seta(1)^2 seta(1)^6;
    1  seta(2)^1  seta(2)^2 seta(2)^6;
    1  seta(3)^1  seta(3)^2 seta(3)^6;
    1  seta(4)^1  seta(4)^2 seta(4)^6];
sigref=Mdata.sigT00;
sigUT=Mdata.sigUT;
sigPST=Mdata.sigPST;
sigBT=Mdata.sigBT;
sigBC=Mdata.sigBC;
sigUC=Mdata.sigUC;
sigSS=Mdata.sigSS;
rightTemp(1)=sigref/(sigSS*sqrt(3));
rightTemp(2)=sigref/(sigUT);
rightTemp(3)=sigref/(sigPST*sqrt(3)/2);
rightTemp(4)=sigref/(sigBT);
faeta=Mf\rightTemp';
eta=(sig.xx+sig.yy)/(MisesPlaneStress(sig));
sigvm=MisesPlaneStress(sig);
f_eta=faeta(1)+faeta(2)*eta^1+faeta(3)*eta^2+faeta(4)*eta^6;
eff_sig=f_eta*sigvm;


end


















function [effstress] = MisesPlaneStress(sig)

effstress=sqrt(sig.xx^2+sig.yy^2-sig.xx*sig.yy+3*sig.xy^2);


end

