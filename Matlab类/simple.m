classdef simple<handle
    
    properties
        p_a
        p_b
    end
    
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

