
function [sigbar] = effect_stress(MatData,mdata,sig,calType,yieldType)
    
m=yieldType;

if m==1
    sigbar=effstress_of_StateMises(MatData,mdata,sig);
elseif m==2
    sigbar=effstress_of_StateMises2(MatData,mdata,sig);
elseif m==3
    sigbar=effstress_of_StateMises3(MatData,mdata,sig);
elseif m==4
    sigbar=effstress_of_StateMises4(MatData,mdata,sig);
elseif m==5
    sigbar=effstress_of_StateMises5(MatData,mdata,sig);
elseif m==-2
    sigbar=effstress_of_StateAsymHill(MatData,mdata,sig,calType);
elseif m==-3
    sigbar=effstress_of_ZhengYoon2024(MatData,mdata,sig,0);
elseif m==-4
    sigbar=effstress_of_ZhangLou2024(MatData,mdata,sig,0);
elseif m==-5
    sigbar=effstress_of_Hou2023(MatData,mdata,sig,0);
elseif m==-6
    sigbar=effstress_of_ZhangLou2023(MatData,mdata,sig,0);
elseif m==-7
    sigbar=effstress_of_Lou2022_for_convex_Test(mdata,sig);
else
    sigbar=effstress_of_StateMisesC(MatData,mdata,sig);
end
    
end