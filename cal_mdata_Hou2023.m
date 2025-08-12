function [mdata]=cal_mdata_Hou2023(Matdata,mattype)

if mattype==1
%DP980:
mdata.hy1=0.0786;
mdata.hy2=0.0409;
mdata.ay=0.7206;
mdata.by=0.3209;
mdata.cy=0.1414;
mdata.dy=0.8731;
mdata.ey=0.8608;
mdata.rhoy=2.7;


elseif mattype==2
%QP980

mdata.hy1=0.0358;
mdata.hy2=0.1204;
mdata.ay=0.8644;
mdata.by=0.3646;
mdata.cy=0.1555;
mdata.dy=0.8037;
mdata.ey=0.7162;
mdata.rhoy=-15.1;


elseif mattype==3
%AA5754-O 
mdata.hy1=-0.0242;
mdata.hy2=0.1304;
mdata.ay=1.1003;
mdata.by=0.6196;
mdata.cy=0.1681;
mdata.dy=1.0538;
mdata.ey=1.1996;
mdata.rhoy=1.8;
    
elseif mattype==4
% Az31

mdata.hy1=-0.9252;
mdata.hy2=-1.0170;
mdata.ay=13.7365;
mdata.by=-0.7960;
mdata.cy=12.4572;
mdata.dy=0.9731;
mdata.ey=0.9851;
mdata.rhoy=2.8;
elseif mattype==5
Hou2023data=[0.2061	0.2008	0.3860	0.3146	0.1637	0.9377	1.003 1.5];
mdata.hy1=Hou2023data(1);
mdata.hy2=Hou2023data(2);
mdata.ay=Hou2023data(3);
mdata.by=Hou2023data(4);
mdata.cy=Hou2023data(5);
mdata.dy=Hou2023data(6);
mdata.ey=Hou2023data(7);
mdata.rhoy=Hou2023data(8);

end




end