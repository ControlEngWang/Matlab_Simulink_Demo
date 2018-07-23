%% 类名称
% classdef开始，end结束
classdef simple
    
    %% 属性名
    % properties开始，end结束
    properties
        p_a
        p_b
    end
    
    %% 方法名
    % methods开始，end结束
    % 方法的定义与Matlab函数一致
    methods
        function Init(obj,a,b)
            obj.p_a=a;
            obj.p_b=b;
        end
        function PrintInfo(obj)
            disp(['p_a: ',num2str(obj.p_a),'; p_b: ',obj.p_b]);
        end
    end
    
end

