function varargout = pi_tune(varargin)
% PI_TUNE MATLAB code for pi_tune.fig
%      PI_TUNE, by itself, creates a new PI_TUNE or raises the existing
%      singleton*.
%
%      H = PI_TUNE returns the handle to a new PI_TUNE or the handle to
%      the existing singleton*.
%
%      PI_TUNE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PI_TUNE.M with the given input arguments.
%
%      PI_TUNE('Property','Value',...) creates a new PI_TUNE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before pi_tune_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to pi_tune_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help pi_tune

% Last Modified by GUIDE v2.5 07-Jun-2018 21:16:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @pi_tune_OpeningFcn, ...
                   'gui_OutputFcn',  @pi_tune_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before pi_tune is made visible.
function pi_tune_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to pi_tune (see VARARGIN)

% Choose default command line output for pi_tune
handles.output = hObject;

% initial parameters
handles.param_P=1;
handles.param_I=1;
handles.num=[1];
handles.den=[10 11 1];
set(handles.edit_P,'String','1');
set(handles.edit_I,'String','1');
set(handles.slider_P,'Value',1);
set(handles.slider_I,'Value',1);
updatePlots(handles);

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes pi_tune wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = pi_tune_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in checkbox_Step.
function checkbox_Step_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Step (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_Step
show_axes(handles);



% --- Executes on button press in checkbox_Freq.
function checkbox_Freq_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_Freq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_Freq
show_axes(handles);


% --- Executes on slider movement.
function slider_P_Callback(hObject, eventdata, handles)
% hObject    handle to slider_P (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
value=get(handles.slider_P,'Value');
set(handles.edit_P,'String',num2str(value));
handles.param_P=value;
updatePlots(handles);
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function slider_P_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_P (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_I_Callback(hObject, eventdata, handles)
% hObject    handle to slider_I (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
value=get(handles.slider_I,'Value');
set(handles.edit_I,'String',num2str(value));
handles.param_I=value;
updatePlots(handles);
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function slider_I_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_I (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit_P_Callback(hObject, eventdata, handles)
% hObject    handle to edit_P (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_P as text
%        str2double(get(hObject,'String')) returns contents of edit_P as a double
value=str2double(get(handles.edit_P,'String'));
set(handles.slider_P,'Value',value);
handles.param_P=value;
updatePlots(handles);
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit_P_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_P (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_I_Callback(hObject, eventdata, handles)
% hObject    handle to edit_I (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_I as text
%        str2double(get(hObject,'String')) returns contents of edit_I as a double
value=str2double(get(handles.edit_I,'String'));
set(handles.slider_I,'Value',value);
handles.param_I=value;
updatePlots(handles);
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit_I_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_I (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in uibuttongroup1.
function uibuttongroup1_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup1 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(handles.radiobutton_PI,'Value')==1)
    set(handles.text3,'Visible','on'); 
    set(handles.slider_I,'Visible','on');
    set(handles.edit_I,'Visible','on');
else
    set(handles.text3,'Visible','off');
    set(handles.slider_I,'Visible','off');
    set(handles.edit_I,'Visible','off');
end
