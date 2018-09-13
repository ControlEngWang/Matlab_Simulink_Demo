%% ���ݼ��
% ��һ���Ƕ��ʽϵͳ�У�����sin��cos����Ҫ���Ĵ�����Դ�ģ����һ����ò�������
% ��ֵ�ķ������м��㡣
% ʹ��Matlab���� interp1 �����Է���ķ������㷨�ľ��ȡ�

%% ��������
% ���С
count=128;
%%
% �Ŵ�ϵ��
full_value=2^15;

%% ����Ԥ����� s_index
% ʹ�����Ǻ���ת����ϵ��ֻ��ҪԤ����0~90�� sin ֵ����
index=(0:1:count-1)*pi/2/count;
s_index=round(full_value*sin(index));

%% ����ֵ�� s_index_split
split_n=0.01;
index_split=(0:split_n:count-split_n)*pi/2/count;
s_index_split=round(full_value*sin(index_split));

%% ʹ�ú��� interp1������Ԥ��������ɵĲ�ֵ��
s_index_interp=round(interp1(index,s_index,index_split));

%% ���Ʋ�ֵ���ߺ��������
subplot(211);
plot(index_split/pi*180,s_index_interp,index_split/pi*180,s_index_split);
grid on;xlabel('deg');ylabel('sin value');
title(['Table count=',num2str(count),',full value=',num2str(full_value)]);
legend('��ֵ����','��������');
subplot(212);
plot(index_split/pi*180,s_index_interp-s_index_split);
grid on;legend('��ֵ');xlabel('deg');

%% ����
% ��Ԥ������СΪ128��ʹ��16λ�з���������ʾsinֵʱ����ֵ�����������Ϊ
% 1/32768=0.00003051757