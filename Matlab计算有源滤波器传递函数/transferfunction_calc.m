%% ������Դ�˲������ݺ���
%%
% 
% <<../op_tf_calc.png>>
% 

%%
%% �������
syms r4 rf vn
syms vi r1 c1
syms v1 r3 c2
syms r2 vp vo
syms s
%% ���巽��
% ��������������
% vn���������
eq1=(0-vn)/r4+(vo-vn)/rf==0;
% v1���������
eq2=(vi-v1)/r1+(0-v1)*s*c1+(vo-v1)/r3+(vp-v1)*s*c2==0;
% vp���������
eq3=(v1-vp)*s*c2+(0-vp)/r2==0;
% �˷���̷���
eq4=vn==vp;

%% ��ⷽ��
% �ĸ����̣��ĸ�δ֪��:vo,vp,vn,v1
result=solve(eq1,eq2,eq3,eq4,vo,vp,vn,v1);
% ��ȡ vi��vi���ݺ���
vo_tf = result.vo/vi
%% �滻ʵ�ʲ���
% ����һ�����
%%
% Rf=47K,R1=160K,R2=22K,R3=12K,R4=47K
%%
% C1=C2=0.01u
vo_tf=subs(vo_tf,{rf,r1,r2,r3,r4,c1,c2},{47e3,160e3,22e3,12e3,47e3,0.01e-6,0.01e-6});
% ��ȡ���ӷ�ĸ
[num,den]=numden(vo_tf);
% ��ȡ����ʽϵ��
num_coeff=sym2poly(num);
den_coeff=sym2poly(den);
% ��������
sys=tf(double(num_coeff),double(den_coeff))
%%
% ����Bodeͼ
figure;bode(sys)
