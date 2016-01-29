function varargout = Application_Robotic_Arm(varargin)
% APPLICATION_ROBOTIC_ARM MATLAB code for Application_Robotic_Arm.fig
%      APPLICATION_ROBOTIC_ARM, by itself, creates a new APPLICATION_ROBOTIC_ARM or raises the existing
%      singleton*.
%
%      H = APPLICATION_ROBOTIC_ARM returns the handle to a new APPLICATION_ROBOTIC_ARM or the handle to
%      the existing singleton*.
%
%      APPLICATION_ROBOTIC_ARM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APPLICATION_ROBOTIC_ARM.M with the given input arguments.
%
%      APPLICATION_ROBOTIC_ARM('Property','Value',...) creates a new APPLICATION_ROBOTIC_ARM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Application_Robotic_Arm_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Application_Robotic_Arm_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Application_Robotic_Arm

% Last Modified by GUIDE v2.5 06-Jul-2014 02:57:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Application_Robotic_Arm_OpeningFcn, ...
                   'gui_OutputFcn',  @Application_Robotic_Arm_OutputFcn, ...
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

function Application_Robotic_Arm_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;
guidata(hObject, handles);

global posts

Reset()
Assess()
Construction()

axis([-18, 18, -18, 18, 0, 18])
grid on
camlight

set(posts,'Visible','off')

function varargout = Application_Robotic_Arm_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

function pivotTWU_Callback(hObject, eventdata, handles)

global C2 C1 LOcation2

x = get(gco,'Value');
C2 = x;
LOcation2 = Evaluation(C2 + C1);
Assess()
Construction()

camlight

function pivotTWU_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function pivotONE_Callback(hObject, eventdata, handles)

global C1 C2 LOcation1 LOcation2

x = get(gco,'Value');
C1 = x;
LOcation1 = Evaluation(C1);
LOcation2 = Evaluation(C1 + C2);
Assess()
Construction()

camlight

function pivotONE_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function exit_Callback(hObject, eventdata, handles)

close;

function pivotTHRRE_Callback(hObject, eventdata, handles)

global C3

x = get(gco,'Value');
C3 = x;
Assess()
Construction()

camlight

function pivotTHRRE_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function zoom_Callback(hObject, eventdata, handles)

if (get(hObject,'Value') == get(hObject,'Max'))
    
    zoom on
    
else
    
    zoom off
    
end

function rotate_Callback(hObject, eventdata, handles)

if (get(hObject,'Value') == get(hObject,'Max'))
    
    rotate3d on
    
else
    
    rotate3d off
    
end

function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function reset_Callback(hObject, eventdata, handles)

set(handles.pivotONE,'Value',0)
set(handles.pivotTWU,'Value',0)
set(handles.pivotTHRRE,'Value',0)
set(handles.pivotFOUR,'Value',0)
set(handles.pivotFIVE,'Value',0)

global posts

Reset()
Assess()
Construction()

set(handles.textAuthor,'Visible','off')
set(handles.school,'Visible','off')
set(handles.posts1,'Visible','off')
set(handles.posts2,'Visible','off')
set(posts,'Visible','off');

zoom out
axis([-18, 18, -18, 18, 0, 18])
camlight

function pivotFOUR_Callback(hObject, eventdata, handles)
global C4

x = get(gco,'Value');
C4 = x;
Assess()
Construction()

camlight

function pivotFOUR_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function help_Callback(hObject, eventdata, handles)

global posts counter1 

set(handles.textAuthor,'Visible','off')

if (counter1 == 0)
    
    set(posts,'Visible','on')
    set(handles.school,'Visible','on')
    set(handles.posts1,'Visible','on')
    set(handles.posts2,'Visible','on')
    counter1 = 1;
    
else
    
    set(posts,'Visible','off')
    set(handles.school,'Visible','off')
    set(handles.posts1,'Visible','off')
    set(handles.posts2,'Visible','off')
    counter1 = 0;
    
end

camlight

function translational_Callback(hObject, eventdata, handles)

global counter2

if (get(hObject,'Value') == get(hObject,'Max'))
    
    counter2 = 1;
    
else
    
    counter2 = 0;
    
end

function WORKAREA_WindowButtonDownFcn(hObject, eventdata, handles)

global pivotx0 pivoty0 counter2

if counter2 == 1

    tran=get(gca,'CurrentPoint');
    
    pivotx0 = tran(2, 1);
    pivoty0 = tran(2, 2);

    if pivotx0 <= 13 && -13 <= pivotx0 && pivoty0 <= 13 && -13 <= pivoty0
    
        Assess()
        Construction()
        
    else
        
        pivotx0 = 0;
        pivoty0 = 0;
    
    end
    
end

camlight

function pivotFIVE_Callback(hObject, eventdata, handles)
global C5 w3

x = get(gco,'Value');
C5 = x;
Assess()
Construction()

axis([(-18 - w3*4),(18 + w3*4),(-18 - w3*4),(18 + w3*4),0,(18 + w3*4)])
camlight

function pivotFIVE_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function ok_Callback(hObject, eventdata, handles)

global posts

set(handles.pivotONE,'Value',0)
set(handles.pivotTWU,'Value',0)
set(handles.pivotTHRRE,'Value',0)
set(handles.pivotFOUR,'Value',0)
set(handles.pivotFIVE,'Value',0)
set(handles.animation,'Visible','on')
set(posts,'Visible','off')
set(handles.school,'Visible','off')
set(handles.posts1,'Visible','off')
set(handles.posts2,'Visible','off')
set(handles.textAuthor,'Visible','off')

Animation(str2double(get(handles.editpivotONE,'String')), str2double(get(handles.editpivotTWO,'String')), str2double(get(handles.editpivotTHRRE,'String')))
set(handles.animation,'Visible','off')
set(handles.editpivotONE,'String',0)
set(handles.editpivotTWO,'String',0)
set(handles.editpivotTHRRE,'String',0)

camlight

function editpivotONE_Callback(hObject, eventdata, handles)

function editpivotONE_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editpivotTWO_Callback(hObject, eventdata, handles)

function editpivotTWO_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editpivotTHRRE_Callback(hObject, eventdata, handles)

function editpivotTHRRE_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in author.
function author_Callback(hObject, eventdata, handles)

global counter1 posts

set(posts,'Visible','off')
set(handles.school,'Visible','off')
set(handles.posts1,'Visible','off')
set(handles.posts2,'Visible','off')

if (counter1 == 0)
    
    set(handles.textAuthor,'Visible','on')
    counter1 = 1;
    
else
    
    set(handles.textAuthor,'Visible','off')
    counter1 = 0;
    
end

camlight
