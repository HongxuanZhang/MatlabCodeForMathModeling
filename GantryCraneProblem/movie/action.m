function varargout = action(varargin)
% ACTION MATLAB code for action.fig
%      ACTION, by itself, creates a new ACTION or raises the existing
%      singleton*.
%
%      H = ACTION returns the handle to a new ACTION or the handle to
%      the existing singleton*.
%
%      ACTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ACTION.M with the given input arguments.
%
%      ACTION('Property','Value',...) creates a new ACTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before action_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to action_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help action

% Last Modified by GUIDE v2.5 24-Aug-2019 15:39:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @action_OpeningFcn, ...
                   'gui_OutputFcn',  @action_OutputFcn, ...
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


% --- Executes just before action is made visible.
function action_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to action (see VARARGIN)

% Choose default command line output for action
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes action wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = action_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hold(handles.axes1,'off');
hold(handles.axes2,'off');
hold(handles.axes3,'off');
hold(handles.axes4,'off');
delta_t = 1/1000;

a = str2num(get(handles.edit1,'String'));
m = str2num(get(handles.edit2,'String'));
t1 = str2num(get(handles.edit3,'String'));
t3 = str2num(get(handles.edit4,'String'));
L = 15;
g = 9.8;
[theta,theta_d1,theta_d2,t2,t4,v_x,k] = GCsystemSolution(a,t1,t3,m,1/1000,0);

t_1 = 0:delta_t:t1;
m_x1 = 0.5.*a.*(t_1).^2;
t_2 = t1+delta_t:delta_t:t1+t2;
m_x2 = max(m_x1)+a.*t1.*(t_2-t1);
t_3 = t1+t2+delta_t:delta_t:t1+t2+t3;
m_x3 = max(m_x2)+a.*t1.*(t_3-t1-t2)-0.5.*a.*(t_3-t1-t2).^2;
t_4 = t1+t2+t3+delta_t:delta_t:t1+t2+t3+t4;
m_x4 = max(m_x3)+a.*(t1-t3).*(t_4-(t1+t2+t3));
x = [m_x1,m_x2,m_x3,m_x4];
Time = [t_1,t_2,t_3,t_4];



Lx = 0:0.1:75;
Ly = ones(1,length(Lx)).*15;

plot(handles.axes1,Lx,Ly,'LineWidth',2);
hold on;
h = plot(handles.axes1,0,15,'ko','MarkerFaceColor','g','MarkerSize',10,'Erasemode','xor');
axes(handles.axes1);
plot(0,0);

mass_xpos = x-6.*sin(theta(1:length(x)));
mass_ypos = 15 - 6.*cos(theta(1:length(x)));
f = plot(handles.axes1,[0,0],[12,15],'-','LineWidth',3,'Erasemode','xor');
hold on;
G = plot(handles.axes1,[0,0],[12,15],'-.','LineWidth',1,'Erasemode','xor');
Ma = plot(handles.axes1,mass_xpos(1),mass_ypos(1),'bs','LineWidth',10,'Erasemode','xor');
hold(handles.axes1,'off');

% axes(handles.axes2);
hd4 = plot(handles.axes2,Time(1:length(x)),(theta(1:length(x))./pi).*180);
hd5 = plot(handles.axes3,Time(1:length(x)),theta_d1(1:length(x)));
hd6 = plot(handles.axes4,Time(1:length(x)),theta_d2(1:length(x)));
set(handles.axes2,'XLim',[0 Time(end)])
set(handles.axes3,'XLim',[0 Time(end)])
set(handles.axes4,'XLim',[0 Time(end)])
hold(handles.axes2,'on');
hold(handles.axes3,'on');
hold(handles.axes4,'on');
hd1 = plot(handles.axes2,[0],theta(1).*180/pi,'r*','LineWidth',1,'Erasemode','xor');
hd2 = plot(handles.axes3,[0],theta_d1(1),'r*','LineWidth',1,'Erasemode','xor');
hd3 = plot(handles.axes4,[0],theta_d2(1),'r*','LineWidth',1,'Erasemode','xor');

for i = 1:100:length(x)
    set(h,'xdata',x(i),'ydata',15);
    pause(0);
    set(f,'xdata',[mass_xpos(i),x(i)],'ydata',[mass_ypos(i),15]);
    set(G,'xdata',[x(i),x(i)],'ydata',[8,15]);
    set(Ma,'xdata',mass_xpos(i),'ydata',mass_ypos(i));
    set(hd1,'xdata',Time(i),'ydata',theta(i).*180/pi);
    set(hd2,'xdata',Time(i),'ydata',theta_d1(i));
    set(hd3,'xdata',Time(i),'ydata',theta_d2(i));
    set(hd4,'xdata',Time(1:i),'ydata',theta(1:i).*180./pi);
    set(hd5,'xdata',Time(1:i),'ydata',theta_d1(1:i));
    set(hd6,'xdata',Time(1:i),'ydata',theta_d2(1:i));
    drawnow
    if Time(i)<t1
        A = a;
        V = a.*Time(i);
        T =m*g*cos(theta(i))+m*a*sin(theta(i))+(m*theta_d1(i)^2)*L;
    elseif Time(i)<t1+t2
        A = 0;
        V = a.*t1;
        T =m*g*cos(theta(i))+(m*theta_d1(i)^2)*L;
    elseif Time(i)< t1+t2+t3
        A = -a;
        V = a.*t1-a.*(Time(i)-t1-t2);
        T =m*g*cos(theta(i))-m*a*sin(theta(i))+(m*theta_d1(i)^2)*L;
    else
        A = 0;
        V = a.*(t1-t3);
        T =m*g*cos(theta(i))+(m*theta_d1(i)^2)*L;
    end
%     set(handles.edit14,'string',c);
%     set(handles.edit15,'string',c);
    set(handles.text26,'string',theta(i));
    set(handles.text17,'string',A);
    set(handles.text15,'string',V);
    V_m = V-theta_d1(i).*L.*cos(theta(i));
    set(handles.text16,'string',V_m);
    set(handles.text29,'string',Time(i));
    set(handles.text14,'string',T);
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
