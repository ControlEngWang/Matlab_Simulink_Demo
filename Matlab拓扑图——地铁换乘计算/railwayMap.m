classdef railwayMap<handle
    properties
        stations
        connections
    end
    
    methods
        function Init(obj)
            obj.stations={};
            obj.connections=[];
        end
        function AddLine(obj,line_str)
            tmp=strsplit(strtrim(line_str),' ');
            
            % add stations
            index_array=zeros(1,numel(tmp));
            for i=1:numel(tmp)
                station=tmp{i};
                % search if the station is alreay created
                index=obj.SearchStation(station);
                if(index==-1)
                    obj.stations=[obj.stations station];
                    index_array(i)=numel(obj.stations);
                else
                    index_array(i)=index;
                end
            end
            
            % add path
            path=[];
            for i=1:numel(tmp)
                if(i==1)
                    index_s=index_array(i);
                    index_e=index_array(i+1);
                    tmp_connection=[index_s;index_e;...
                        obj.CallWeight(obj.stations{index_s},obj.stations{index_e})];
                    path=[path tmp_connection];
                else if(i==numel(tmp))
                        index_s=index_array(i);
                        index_e=index_array(i-1);
                        tmp_connection=[index_s;index_e;...
                            obj.CallWeight(obj.stations{index_s},obj.stations{index_e})];
                        path=[path tmp_connection];
                    else
                        index_s=index_array(i);
                        index_e=index_array(i-1);
                        tmp_connection=[index_s;index_e;...
                            obj.CallWeight(obj.stations{index_s},obj.stations{index_e})];
                        path=[path tmp_connection];
                        
                        try
                            index_s=index_array(i);
                            index_e=index_array(i+1);
                        catch
                            disp(i);
                        end
                        tmp_connection=[index_s;index_e;...
                            obj.CallWeight(obj.stations{index_s},obj.stations{index_e})];
                        path=[path tmp_connection];
                    end
                end
            end
            obj.connections=[obj.connections path];
        end
        function weight=CallWeight(obj,start_s,end_s)
            weight=1;
        end
        function [Dist,Path]=CalShortestPath(obj,start_s,end_s)
            s=obj.connections(1,:);
            e=obj.connections(2,:);
            w=obj.connections(3,:);
            g=sparse(s,e,w);
            g(length(s),length(s))=0;
            [Dist,Path]=graphshortestpath(g,obj.SearchStation(start_s),obj.SearchStation(end_s));
            disp(['******',start_s,' µ½ ',end_s,'*****']);
            disp(join(obj.stations(Path)))
            
        end
        
        % search the station
        function index=SearchStation(obj,name)
            for i=1:numel(obj.stations)
                if(strcmp(obj.stations{i},name)==1)
                    index=i;
                    return;
                end
            end
            index=-1;
        end
    end
    
end

