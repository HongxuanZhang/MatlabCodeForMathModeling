function varargout = moorSystemDraw(varargin)
% MOORSYSTEMDRAW MATLAB code for moorSystemDraw.fig
%      MOORSYSTEMDRAW, by itself, creates a new MOORSYSTEMDRAW or raises the existing
%      singleton*.
%
%      H = MOORSYSTEMDRAW returns the handle to a new MOORSYSTEMDRAW or the handle to
%      the existing singleton*.
%
%      MOORSYSTEMDRAW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MOORSYSTEMDRAW.M with the given input arguments.
%
%      MOORSYSTEMDRAW('Property','Value',...) creates a new MOORSYSTEMDRAW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before moorSystemDraw_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to moorSystemDraw_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help moorSystemDraw

% Last Modified by GUIDE v2.5 14-Aug-2019 14:05:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @moorSystemDraw_OpeningFcn, ...
                   'gui_OutputFcn',  @moorSystemDraw_OutputFcn, ...
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


% --- Executes just before moorSystemDraw is made visible.
function moorSystemDraw_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to moorSystemDraw (see VARARGIN)

% Choose default command line output for moorSystemDraw
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes moorSystemDraw wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = moorSystemDraw_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
axis manual;
%ylim(handles.axes1,[0 35]);
v_wind = str2num(get(handles.edit1,'String'));
v_water = str2num(get(handles.edit2,'String'));
depth = str2num(get(handles.edit3,'String'));
ball_mass = str2num(get(handles.edit4,'String'));
anchor_type = str2num(get(handles.edit5,'String'))
chain_length = str2num(get(handles.edit6,'String'));
[phi,f,h] = moorsys(anchor_type,chain_length,ball_mass,depth,v_wind,v_water,0);
anchor_node =...
    [
    0.0780    0.1050    0.1200    0.1500    0.1800;  %每节长度/m
    0.2496    0.7350    1.5000    2.9250    5.0616;  %每节质量/kg
    0.3174    0.9346    1.9073    3.7192    6.4359;  %每节所受的浮力/N
    0.0227    0.0336    0.0449    0.0561    0.0673;  %每种链条的估计直径值/m
    ];

nchain = round(chain_length/anchor_node(1,anchor_type));

m   =  [1000,10*ones(1,4),100,anchor_node(2,anchor_type)*ones(1,nchain)] ;  % 质量
lg  =  [2,1*ones(1,4),1,anchor_node(1,anchor_type)*ones(1,nchain)]      ;   % 长度，或者说是吃水深度
da  =  [2,0.05*ones(1,4),0.3,anchor_node(4,anchor_type)*ones(1,nchain)];    % 直径

[X,Y] = deal(zeros(1,length(lg)))
lg = fliplr(lg)
phi = fliplr(phi)
for i = 1:length(lg)
    if i==1
        X(i) = 1;
        Y(i) = 0;
    else
        X(i) = X(i-1)+lg(i-1).*sind(phi(i-1));
        Y(i) = Y(i-1)+lg(i-1).*cosd(phi(i-1));
    end
end
axis([-5,30,0,30]);
axis equal;
plot(X(1:2:nchain+1),Y(1:2:nchain+1),'.k');
axis([0,35,0,30]);
axis equal;
hold on;
rectangle('Position',[0,0,1,1],'FaceColor',[1 0 0]);
hold on;
plot(X(nchain+1:nchain+2),Y(nchain+1:nchain+2),'-c','lineWidth',7);
rectangle('Position',[X(nchain+1)-0.5,Y(nchain+1)-3,1,1],'Curvature',[1 1],'FaceColor',[1,0,0]);
plot([X(nchain+1),X(nchain+1)],[Y(nchain+1),Y(nchain+1)-2]);
plot(X(nchain+2:nchain+6),Y(nchain+2:nchain+6),'-b','lineWidth',1);
plot(X(nchain+2:nchain+6),Y(nchain+2:nchain+6),'ro','MarkerSize',5);
refline(0,depth);
rectangle('Position',[X(nchain+6)-1,Y(nchain+6),2,2],'FaceColor',[1 0 1]);
hold off;
%axis manual;


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


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
