%% 初始化小组球队
% Init: 初始化
%
% AddTeam: 添加球队
gourpB=foot_group;
gourpB.Init();
gourpB.AddTeam('葡萄牙');
gourpB.AddTeam('西班牙');
gourpB.AddTeam('摩洛哥');
gourpB.AddTeam('伊朗');
%% 添加比赛结果
% AddGame: 添加比赛结果
gourpB.AddGame('葡萄牙',3,'西班牙',3);
gourpB.AddGame('摩洛哥',0,'伊朗',1);
gourpB.AddGame('葡萄牙',1,'摩洛哥',0);
gourpB.AddGame('伊朗',0,'西班牙',1);
gourpB.AddGame('伊朗',1,'葡萄牙',1);
gourpB.AddGame('西班牙',2,'摩洛哥',2);
%% 对结果进行排序
% SortByResult: 计算积分、净胜球，并排序
disp('**************按照积分排序****************');
gourpB.SortByResult('point')
disp('**************按照净胜球排序****************');
gourpB.SortByResult('diff')