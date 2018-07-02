classdef foot_team<handle
    %% Properties
    properties
        name
        game_results
    end
  
    %% Methods
    methods
        % initial object
        function Init(obj,name)
            obj.name=name;
            obj.game_results=[];
        end
        
        % add game result
        function AddGameResult(obj,opponent_name,game_type,goal_self,goal_opponent)
            tmp={opponent_name,game_type,goal_self,goal_opponent};
            obj.game_results=[obj.game_results;tmp];
        end
        
        % calculate total points
        function points=GetPoints(obj)
            points=0;
            for i=1:numel(obj.game_results)/4
                tmp=obj.game_results(i,:);
                if(tmp{3}>tmp{4})
                    points=points+3;
                else if(tmp{3}==tmp{4})
                        points=points+1;
                    end
                end
            end
        end
        
        % calulate self goal
        function goals=GetSelfGoal(obj,opponent)
            if(nargin==1)
                opponent='all';
            end
            goals=0;
            for i=1:numel(obj.game_results)/4
                tmp=obj.game_results(i,:);
                if(strcmp(opponent,'all'))
                    goals=goals+tmp{3};
                else
                    if(strcmp(opponent,tmp{1}))
                        goals=goals+tmp{3};
                    end
                end
            end
        end
        
        % calulate self goal
        function goals=GetOpponentGoal(obj,opponent)
            if(nargin==1)
                opponent='all';
            end
            goals=0;
            for i=1:numel(obj.game_results)/4
                tmp=obj.game_results(i,:);
                if(strcmp(opponent,'all'))
                    goals=goals+tmp{4};
                else
                    if(strcmp(opponent,tmp{1}))
                        goals=goals+tmp{4};
                    end
                end
            end
        end
        
        % calculate diffenrence goal
        function goals=GetDifferencetGoal(obj,opponent)
            if(nargin==1)
                opponent='all';
            end
            goals=obj.GetSelfGoal(opponent)-obj.GetOpponentGoal(opponent);
        end
        
    end
end
