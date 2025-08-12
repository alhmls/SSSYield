function [a1,b1] = Convex_regin_StateYieldFunction_for_QP1180(a0,b0,tol,isreverse)

% a0 :区间初始左值
% b0 ：区间右值

% a1: 凸区域 区间左值 
% b1: 凸区域 区间右值 

yieldType=-2;  % -2 对应的 屈服函数的类型
isplot=0;
calType=1;

if isreverse==0
M=a0:tol:b0;
convex=1;
convex_last=0;
a1=a0;
b1=b0;
for i=1:length(M)
    epsm=M(i);
    Matdata=give_matdata_QP1180(epsm);
    mdata = call_factor_of_StateAsymHill(Matdata);
    convex = convex_Test_for_StateYieldFunction2(Matdata,mdata,Matdata.sigT00,calType,yieldType,isplot);
    if (convex==1&&convex_last==0&&i~=1)
        Matdata=give_matdata_QP1180(M(i-1));
        convex_Test_for_StateYieldFunction2(Matdata,mdata,Matdata.sigT00,0,yieldType,1);
        a1=epsm;
    end
    if (convex==1&&convex_last==0&&i==1)
        a1=epsm;
    end
    
    if (convex==0&&convex_last==1)
        b1=M(i-1);
        Matdata=give_matdata_QP1180(M(i));
        convex_Test_for_StateYieldFunction2(Matdata,mdata,Matdata.sigT00,0,yieldType,1);
        break;
    end
    
    convex_last=convex;
    fprintf('EPS=%e,Convex=%d\n',epsm,convex);
    
end

else
%% 区间倒序

M=fliplr(a0:tol:b0);
convex=1;
convex_last=0;
for i=1:length(M)
    epsm=M(i);
    Matdata=give_matdata_QP1180(epsm);
    mdata = call_factor_of_StateAsymHill(Matdata);
    convex = convex_Test_for_StateYieldFunction2(Matdata,mdata,Matdata.sigT00,calType,yieldType,isplot);
    
    if (convex==1&&convex_last==0&&i~=1)
        Matdata=give_matdata_QP1180(M(i-1));
        convex_Test_for_StateYieldFunction2(Matdata,mdata,Matdata.sigT00,0,yieldType,1);
        b1=epsm;
    end
    if (convex==1&&convex_last==0&&i==1)
        b1=epsm;
    end
    
    if (convex==0&&convex_last==1)
        a1=M(i-1);
        Matdata=give_matdata_QP1180(M(i));
        convex_Test_for_StateYieldFunction2(Matdata,mdata,Matdata.sigT00,0,yieldType,1);
        break;
    end
    
    convex_last=convex;
    fprintf('EPS=%e,Convex=%d\n',epsm,convex);
    
end

end  %% end isreverse







end