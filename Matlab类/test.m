%% 新建球队 a 
a=foot_team

%% 初始化球队 a 为德国
a.Init('德国');

%% 添加各比赛结果，各参数分别表示
%   对手名
%   比赛类型，主场或客场。世界杯比赛，以客场算。
%   自己进球数
%   对手进球数
a.AddGameResult('韩国','visiting',0,2);
a.AddGameResult('墨西哥','visiting',0,1);
a.AddGameResult('克罗地亚','visiting',2,1);

%% 计算总积分
points=a.GetPoints()

%% 计算总进球数
goals=a.GetSelfGoal()

%% 计算失球数
opponent_goals=a.GetOpponentGoal()

%% 计算净胜球
diff_goals=a.GetDifferencetGoal()