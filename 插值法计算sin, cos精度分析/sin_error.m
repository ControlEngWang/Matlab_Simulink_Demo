%% 内容简介
% 在一般的嵌入式系统中，计算sin和cos是需要消耗大量资源的，因此一般采用查表加线性
% 插值的方法进行计算。
% 使用Matlab函数 interp1 ，可以方便的分析该算法的精度。

%% 参数定义
% 表大小
count=128;
%%
% 放大系数
full_value=2^15;

%% 生成预定义表 s_index
% 使用三角函数转换关系，只需要预定义0~90度 sin 值即可
index=(0:1:count-1)*pi/2/count;
s_index=round(full_value*sin(index));

%% 理想值表 s_index_split
split_n=0.01;
index_split=(0:split_n:count-split_n)*pi/2/count;
s_index_split=round(full_value*sin(index_split));

%% 使用函数 interp1，基于预定义表生成的插值表
s_index_interp=round(interp1(index,s_index,index_split));

%% 绘制插值曲线和误差曲线
subplot(211);
plot(index_split/pi*180,s_index_interp,index_split/pi*180,s_index_split);
grid on;xlabel('deg');ylabel('sin value');
title(['Table count=',num2str(count),',full value=',num2str(full_value)]);
legend('插值曲线','理想曲线');
subplot(212);
plot(index_split/pi*180,s_index_interp-s_index_split);
grid on;legend('差值');xlabel('deg');

%% 结论
% 当预定义表大小为128，使用16位有符号数来表示sin值时，插值引入的误差最大为
% 1/32768=0.00003051757