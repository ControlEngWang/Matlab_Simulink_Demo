function [step,gain,phase]=updatePlots( handles )
tmp.num=1;tmp.den=[5 6 1];
tmp.param_I=get(handles.slider_I,'Value');
tmp.param_P=get(handles.slider_P,'Value');

step_show=get(handles.checkbox_Step,'Value');
freq_show=get(handles.checkbox_Freq,'Value');

%% Plot step response
assignin('base','Params',tmp);
sim('pi_model');

    step=plot(handles.axes_Step,simout.Time,simout.Data);grid(handles.axes_Step,'on');
    if(step_show==0)
        set(step,'Visible','off');
        set(handles.axes_Step,'Visible','off');
    end

%% Plot bode
op = tf(tmp.num,tmp.den)*(tmp.param_P+tf(tmp.param_I,[1 0]));
freqs=0.1:0.1:1000;
freq_resp=squeeze(freqresp(op,freqs*2*pi));

    gain=semilogx(handles.axes_Freq_gain,freqs,20*log10(abs(freq_resp)));grid(handles.axes_Freq_gain,'on');
    phase=semilogx(handles.axes_Freq_phase,freqs,angle(freq_resp)*180/pi);grid(handles.axes_Freq_phase,'on');
    
    if(freq_show==0)
        set(gain,'Visible','off');
        set(phase,'Visible','off');
        set(handles.axes_Freq_gain,'Visible','off');
        set(handles.axes_Freq_phase,'Visible','off');
    end

end

