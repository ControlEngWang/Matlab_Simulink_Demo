%% �½���� a 
a=foot_team

%% ��ʼ����� a Ϊ�¹�
a.Init('�¹�');

%% ��Ӹ�����������������ֱ��ʾ
%   ������
%   �������ͣ�������ͳ������籭�������Կͳ��㡣
%   �Լ�������
%   ���ֽ�����
a.AddGameResult('����','visiting',0,2);
a.AddGameResult('ī����','visiting',0,1);
a.AddGameResult('���޵���','visiting',2,1);

%% �����ܻ���
points=a.GetPoints()

%% �����ܽ�����
goals=a.GetSelfGoal()

%% ����ʧ����
opponent_goals=a.GetOpponentGoal()

%% ���㾻ʤ��
diff_goals=a.GetDifferencetGoal()