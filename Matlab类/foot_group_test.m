%% ��ʼ��С�����
% Init: ��ʼ��
%
% AddTeam: ������
gourpB=foot_group;
gourpB.Init();
gourpB.AddTeam('������');
gourpB.AddTeam('������');
gourpB.AddTeam('Ħ���');
gourpB.AddTeam('����');
%% ��ӱ������
% AddGame: ��ӱ������
gourpB.AddGame('������',3,'������',3);
gourpB.AddGame('Ħ���',0,'����',1);
gourpB.AddGame('������',1,'Ħ���',0);
gourpB.AddGame('����',0,'������',1);
gourpB.AddGame('����',1,'������',1);
gourpB.AddGame('������',2,'Ħ���',2);
%% �Խ����������
% SortByResult: ������֡���ʤ�򣬲�����
disp('**************���ջ�������****************');
gourpB.SortByResult('point')
disp('**************���վ�ʤ������****************');
gourpB.SortByResult('diff')