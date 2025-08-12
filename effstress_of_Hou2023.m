function [eff_sig] = effstress_of_Hou2023(Mdata,mdata,sig,type)
%A new anisotropic-asymmetric yield criterion covering wider 
%stress states in sheet metal forming

valn=8;
valmuy=0.75;

ay=mdata.ay;
by=mdata.by;
cy=mdata.cy;
dy=mdata.dy;
ey=mdata.ey;

hy1=mdata.hy1;
hy2=mdata.hy2;


rhoy=mdata.rhoy;

Xy1=(sig.xx+dy*sig.yy)/2+sqrt(((sig.xx-dy*sig.yy)/2)^2+(ey*sig.xy)^2);
Xy2=(sig.xx+dy*sig.yy)/2-sqrt(((sig.xx-dy*sig.yy)/2)^2+(ey*sig.xy)^2);

fy1=hy1*sig.xx+hy2*sig.yy+(ay*Xy1^4-2*by*Xy1^3*Xy2+3*cy*Xy1^2*Xy2^2-2*by*Xy1*Xy2^3+ay*Xy2^4)^(1/4);

J2=cal_J2(sig);
J3=cal_J3(sig);

va1=(27*3^valn/(27-4*rhoy))^(1/(2*valn));
fy2=va1*(1-rhoy*J3^2/J2^3)^(1/(2*valn))*sqrt(J2);

eff_sig=(1-valmuy)*fy1+valmuy*fy2;

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
