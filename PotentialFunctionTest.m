clear
clc
close all


MatData=give_matdata_AA5754_O(0.002);

% MatData=give_matdata_dp980(0.002);

mdata.c=0;

plot_potential_hill(MatData.RT00,MatData.RT45, MatData.RT90,MatData.RC00,MatData.RC45, MatData.RC90,MatData.Txy00,MatData.Cxy00)
convex=1;
convex=convex_Test_for_Potential(MatData,mdata,MatData.Txy00,0)





















