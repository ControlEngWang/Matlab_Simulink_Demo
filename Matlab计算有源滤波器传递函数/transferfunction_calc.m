%% 计算有源滤波器传递函数
%%
% 
% <<../op_tf_calc.png>>
% 

%%
%% 定义变量
syms r4 rf vn
syms vi r1 c1
syms v1 r3 c2
syms r2 vp vo
syms s
%% 定义方程
% 计算各点电流方程
% vn点电流方程
eq1=(0-vn)/r4+(vo-vn)/rf==0;
% v1点电流方程
eq2=(vi-v1)/r1+(0-v1)*s*c1+(vo-v1)/r3+(vp-v1)*s*c2==0;
% vp点电流方程
eq3=(v1-vp)*s*c2+(0-vp)/r2==0;
% 运放虚短方程
eq4=vn==vp;

%% 求解方程
% 四个方程，四个未知数:vo,vp,vn,v1
result=solve(eq1,eq2,eq3,eq4,vo,vp,vn,v1);
% 获取 vi到vi传递函数
vo_tf = result.vo/vi
%% 替换实际参数
% 考虑一种情况
%%
% Rf=47K,R1=160K,R2=22K,R3=12K,R4=47K
%%
% C1=C2=0.01u
vo_tf=subs(vo_tf,{rf,r1,r2,r3,r4,c1,c2},{47e3,160e3,22e3,12e3,47e3,0.01e-6,0.01e-6});
% 获取分子分母
[num,den]=numden(vo_tf);
% 获取多项式系数
num_coeff=sym2poly(num);
den_coeff=sym2poly(den);
% 构建方程
sys=tf(double(num_coeff),double(den_coeff))
%%
% 绘制Bode图
figure;bode(sys)
