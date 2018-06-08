function show_axes( handles )
step_show=get(handles.checkbox_Step,'Value');
freq_show=get(handles.checkbox_Freq,'Value');
%% set size of figure
% pos=get(handles.figure1,'Position');
% if(step_show==0 && freq_show==0)
%     pos(4)=15;pos(2)=69.38;
% else
%     pos(4)=41;pos(2)=43.38;
% end
% set(handles.figure1,'Position',pos);
%% show or hide axes
if(step_show==0)
    set(handles.axes_Step,'Visible','off');
end
if(freq_show==0)
    set(handles.axes_Freq_gain,'Visible','off');
    set(handles.axes_Freq_phase,'Visible','off');
end
if(step_show==1 && freq_show==1)
    set(handles.axes_Step,'Visible','on');
    set(handles.axes_Freq_gain,'Visible','on');
    set(handles.axes_Freq_phase,'Visible','on');
    
    pos=get(handles.axes_Step,'Position');
    pos(3)=56.6;
    set(handles.axes_Step,'Position',pos);
    
    pos=get(handles.axes_Freq_gain,'Position');
    pos(3)=56.6;pos(1)=66.8;
    set(handles.axes_Freq_gain,'Position',pos);
    
    pos=get(handles.axes_Freq_phase,'Position');
    pos(3)=56.6;pos(1)=66.8;
    set(handles.axes_Freq_phase,'Position',pos);
else
    if(step_show==1)
        set(handles.axes_Step,'Visible','on');
        pos=get(handles.axes_Step,'Position');
        pos(3)=117;
        set(handles.axes_Step,'Position',pos);
    else
        if(freq_show==1)
            set(handles.axes_Freq_gain,'Visible','on');
            set(handles.axes_Freq_phase,'Visible','on');
            
            pos=get(handles.axes_Freq_gain,'Position');
            pos(3)=117;pos(1)=7;
            set(handles.axes_Freq_gain,'Position',pos);
            
            pos=get(handles.axes_Freq_phase,'Position');
            pos(3)=117;pos(1)=7;
            set(handles.axes_Freq_phase,'Position',pos);
        end
    end
end
end

