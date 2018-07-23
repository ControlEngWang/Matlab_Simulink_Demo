classdef foot_group<handle
    properties
        teams
    end
    methods
        %% Init: 初始小组成员
        function Init(obj)
            obj.teams=[];
        end
        %% AddTeam: 添加小组球队
        function AddTeam(obj,team)
            tmp=foot_team();
            tmp.Init(team)
            obj.teams=[obj.teams tmp];
        end
        %% AddGame: 添加比赛结果
        function AddGame(obj,team_host,goal_host,...
                team_visting,goal_visiting)
            % search host team, and visitng team
            host_searched=-1;visitng_searched=-1;
            for i=1:numel(obj.teams)
                if(strcmp(obj.teams(i).name,team_host))
                    host_searched=i;
                end
                if(strcmp(obj.teams(i).name,team_visting))
                    visitng_searched=i;
                end
            end
            if(host_searched==-1)
                disp(strcat('host team ',...
                    team_host,'not found!'));
                return;
            end
            if(visitng_searched==-1)
                disp(strcat('visitng team ',...
                    team_visting,'not found!'));
                return;
            end
            
            % team searched, update game result
            tmp=obj.teams(host_searched);
            tmp.AddGameResult(team_visting,'host',...
                goal_host,goal_visiting);
            obj.teams(host_searched)=tmp;
            
            tmp=obj.teams(visitng_searched);
            tmp.AddGameResult(team_host,'visitng',...
                goal_visiting,goal_host);
            obj.teams(visitng_searched)=tmp;
        end
        %% SortByResult: 按结果排序
        function SortByResult(obj,sort_type)
            tmp=zeros(numel(obj.teams),5);
            for i=1:numel(obj.teams)
                tmp(i,1)=i;
                tmp(i,2)=obj.teams(i).GetPoints();
                tmp(i,3)=obj.teams(i).GetSelfGoal();
                tmp(i,4)=obj.teams(i).GetOpponentGoal();
                tmp(i,5)=obj.teams(i).GetDifferencetGoal();
            end
            % switch...case 语句
            switch sort_type
                case 'point'
                    value_index=2;
                case 'selfGoal'
                    value_index=3;
                case 'opponentGoal'
                    value_index=4;
                otherwise
                    value_index=5;
            end
            % 对整行进行排序
            sorted_tmp=sortrows(tmp,value_index);
            for i=1:numel(obj.teams)
                disp(strcat(obj.teams(sorted_tmp(i)).name,':',...
                    sort_type,':',num2str(sorted_tmp(i,value_index))))
            end
        end
        
    end
end