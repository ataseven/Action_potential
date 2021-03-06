tercih=0;
h0 = figure('Units','points', ...
	'Color',[1 1 1], ...
	'Name','EE 515 TERM PROJECT                                                                                                         Yoldas Ataseven', ...
	'NumberTitle','off', ...
	'Position',[165.75 34.35 561 525.5], ...
    'Pointer','arrow',...
	'Resize','off', ...
	'Tag','Fig1');
sim = uicontrol('Parent',h0, ...
	'Units','points', ...
	'Callback','close all', ...
   'ListboxTop',0, ...
	'Callback','sim1', ...
	'Position',[92.25 34.75 79.5 26.25], ...
	'String','Simulate!', ...
	'Tag','Pushbutton1');
kapat = uicontrol('Parent',h0, ...
	'Units','points', ...
	'Callback','close all', ...
	'ListboxTop',0, ...
	'Position',[402.25 34.75 79.5 26.25], ...
	'String','Close', ...
	'Tag','Pushbutton1');
but_single = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'ListboxTop',0, ...
	'Position',[202.5 46.25 70.5 19.5], ...
   'Callback','set(but_more,''Value'',0);set([txtamp2 txtdur2 txtapp2 editamp2 editdur2 editapp2 editamp3 txtamp3 editdur3 txtdur3 editapp3 txtapp3 txtamp4 txtdur4 txtapp4 editamp4 editdur4 editapp4 editamp5 txtamp5 editdur5 txtdur5 editapp5 txtapp5 txtamp6 txtdur6 txtapp6 editamp6 editdur6 editapp6],''Enable'',''off'')', ...
   	'String','Single Stimulus', ...
   'Style','radiobutton', ...
   'Value',1,...
	'Tag','Radiobutton1');
but_more = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'ListboxTop',0, ...
   'Position',[302.5 46.25 70.5 19.5], ...
   'Callback','set(but_single,''Value'',0);set([editamp2 txtamp2 editdur2 txtdur2 editapp2 txtapp2 editamp3 txtamp3 editdur3 txtdur3 editapp3 txtapp3 txtamp4 txtdur4 txtapp4 editamp4 editdur4 editapp4 editamp5 txtamp5 editdur5 txtdur5 editapp5 txtapp5 txtamp6 txtdur6 txtapp6 editamp6 editdur6 editapp6],''Enable'',''on'')', ...
	'String','More Stimuli', ...
	'Style','radiobutton', ...
	'Tag','Radiobutton1');
but_action = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'ListboxTop',0, ...
   'Position',[202.5 26.25 70.5 19.5], ...
   'Callback','set(but_prop,''Value'',0);tercih=0;set(txtpause,''Visible'',''off'');set(txtro,''Visible'',''off'');set(txta,''Visible'',''off'');set(editro,''Visible'',''off'');set(edita,''Visible'',''off'');set(hndl.stop,''Visible'',''off'');set(hndl.pause,''Visible'',''off'');set(editri,''Visible'',''off'');set(txtri,''Visible'',''off'');set(editri,''Enable'',''off'');set(txtri,''Enable'',''off'');', ...
   'Value',1,...
	'String','Generation', ...
	'Style','radiobutton', ...
	'Tag','Radiobutton1');
but_prop = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'ListboxTop',0, ...
   'Position',[302.5 26.25 70.5 19.5], ...
   'Callback','set(but_action,''Value'',0);tercih=1;set(editri,''Visible'',''on'');set(editro,''Visible'',''on'');set(edita,''Visible'',''on'');set(hndl2.ax,''Visible'',''off'');set(hndl.ax,''Visible'',''off'');set(txtri,''Visible'',''on'');set(txtro,''Visible'',''on'');set(txta,''Visible'',''on'');set(editri,''Enable'',''on'');set(txtri,''Enable'',''on'');', ...
	'String','Propagation', ...
	'Style','radiobutton', ...
	'Tag','Radiobutton1');
hndl.ax = axes('Parent',h0, ...
	'Units','pixels', ...
	'CameraUpVector',[0 1 0], ...
	'CameraUpVectorMode','manual', ...
    'Visible','off',...
	'Color',[1 1 1], ...
	'Position',[97 475 566 202], ...
	'Tag','Axes1', ...
	'XColor',[0 0 0], ...
	'YColor',[0 0 0], ...
	'ZColor',[0 0 0]);
hndl2.ax = axes('Parent',h0, ...
	'Units','pixels', ...
	'CameraUpVector',[0 1 0], ...
    'Visible','off',...
	'CameraUpVectorMode','manual', ...
	'Color',[1 1 1], ...
	'Position',[97 268 566 168], ...
	'Tag','Axes1', ...
	'XColor',[0 0 0], ...
	'YColor',[0 0 0], ...
	'ZColor',[0 0 0]);
txtwarn = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'ListboxTop',0, ...
	'Position',[146.25 197.25 241.25 13.5], ...
    'Visible','on',...
	'String','Inputs with negative application times  will be ignored!', ...
	'Style','text', ...
	'Tag','StaticText1');
txttime = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'ListboxTop',0, ...
	'Position',[509.25 174.25 31.25 23.5], ...
    'Visible','off',...
	'String','time(ms)', ...
	'Style','text', ...
	'Tag','StaticText1');
txtexplain = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'ListboxTop',0, ...
	'Position',[116.25 297.25 341.25 113.5], ...
	'String','Use the radio buttons to choose the simulation and input type. The program calculates the membrane potentials with 0.05 msec intervals (and for 40 nodes for propagation). The simulation (and of course processing) duration is dependent on the input.', ...
	'Style','text', ...
	'Tag','StaticText1');

%ri
txtri = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'ListboxTop',0, ...
	'Position',[256.25 237.25 41.25 23.5], ...
	'String','ri (ohms/cm):', ...
    'Visible','off',...
	'Style','text', ...
	'Tag','StaticText1');
editri = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	    'Visible','off',...
        'Enable','off',...
	'ListboxTop',0, ...
	'Position',[256.5 215 38.25 16.5], ...
	'String','33000', ...
	'Style','edit', ...
	'Tag','EditText1');
% end for ri
%ro
txtro = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'ListboxTop',0, ...
	'Position',[306.25 237.25 41.25 23.5], ...
	'String','ro (ohms/cm):', ...
    'Visible','off',...
	'Style','text', ...
	'Tag','StaticText1');
editro = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	    'Visible','off',...
	'ListboxTop',0, ...
	'Position',[306.5 215 38.25 16.5], ...
	'String','0', ...
	'Style','edit', ...
	'Tag','EditText1');
% end for ro
%a
txta = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'ListboxTop',0, ...
	'Position',[206.25 237.25 41.25 28.5], ...
	'String','axon diameter (cm):', ...
    'Visible','off',...
	'Style','text', ...
	'Tag','StaticText1');
edita = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	    'Visible','off',...
	'ListboxTop',0, ...
	'Position',[206.5 215 38.25 16.5], ...
	'String','0.05', ...
	'Style','edit', ...
	'Tag','EditText1');
% end for a
hndl.pause = uicontrol('Parent',h0, ...
   'Units','points', ...
   'Callback','set(txtpause,''Visible'',''on'');set(h0,''Pointer'',''watch'');pause;set(h0,''Pointer'',''arrow'');',...
   'Enable','off',...
   'Visible','off',...
	'ListboxTop',0, ...
	'Position',[13.75 217 39.5 26.25], ...
	'String','Pause', ...
	'Tag','Pushbutton1');
txtpause = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'ListboxTop',0, ...
	'Position',[66.25 217.25 141.25 23.5], ...
	'String','Press any key to continue simulation', ...
    'Visible','off',...
	'Style','text', ...
	'Tag','StaticText1');
hndl.stop = uicontrol('Parent',h0, ...
   'Units','points', ...
   'Callback','looping=0;',...
   'Enable','off',...
   'Visible','off',...
	'ListboxTop',0, ...
	'Position',[505.75 217 39.5 26.25], ...
	'String','Stop', ...
	'Tag','Pushbutton1');
%--------------------------------------------------------input1--------------------------------
%amplitude for input1
txtamp1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'ListboxTop',0, ...
	'Position',[16.25 172.25 41.25 13.5], ...
	'String','Amplitude:', ...
	'Style','text', ...
	'Tag','StaticText1');
editamp1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	    'Enable','on',...
	'ListboxTop',0, ...
	'Position',[16.5 155.25 38.25 16.5], ...
	'String','10', ...
	'Style','edit', ...
	'Tag','EditText1');
% end amplitude for input1

% duration for input1
txtdur1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'ListboxTop',0, ...
	'Position',[16.25 134.5 41.25 10.5], ...
	'String','Duration', ...
	'Style','text', ...
	'Tag','StaticText1');
editdur1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	   'Enable','on',...
	'ListboxTop',0, ...
	'Position',[16.5 115 38.25 16.5], ...
	'String','10', ...
	'Style','edit', ...
	'Tag','EditText1');
% end duration for input1

% Application time for input1
editapp1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
		'ListboxTop',0, ...
	'Position',[16.25 75.75 38.25 16.5], ...
   'String','0', ...
   'Enable','on',...
	'Style','edit', ...
	'Tag','EditText1');
txtapp1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'ListboxTop',0, ...
	'Position',[5.25 95.5 61.25 10.5], ...
	'String','Application time', ...
   'Enable','on',...
	'Style','text', ...
	'Tag','StaticText1');
% end application time for input1


% --------------------------------------------------------input2--------------------------------
% amplitude for input2
editamp2 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
		'ListboxTop',0, ...
    'Enable','off',...
	'Position',[106.75 155.75 38.25 16.5], ...
	'String','0', ...
	'Style','edit', ...
	'Tag','EditText1');
txtamp2 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'ListboxTop',0, ...
   'Enable','off',...
	'Position',[106.75 172.25 41.25 13.5], ...
	'String','Amplitude:', ...
	'Style','text', ... 
	'Tag','StaticText1');
% end amplitude for input2

% duration for input2
editdur2 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
		'ListboxTop',0, ...
	'Position',[106.75 114 38.25 16.5], ...
	'Enable','off',...
    'String','0', ...
	'Style','edit', ...
	'Tag','EditText1');
txtdur2 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
   'Enable','off',...
	'ListboxTop',0, ...
	'Position',[104 134.5 41.25 10.5], ...
	'String','Duration:', ...
	'Style','text', ...
	'Tag','StaticText1');
% end duration for input2

% Application time for input2
editapp2 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
		'ListboxTop',0, ...
	'Position',[106.25 75.75 38.25 16.5], ...
   'String','0', ...
   'Enable','off',...
	'Style','edit', ...
	'Tag','EditText1');
txtapp2 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'ListboxTop',0, ...
	'Position',[95.25 95.5 61.25 10.5], ...
	'String','Application time', ...
   'Enable','off',...
	'Style','text', ...
	'Tag','StaticText1');
% end application time for input2


% --------------------------------------------------------input3--------------------------------
% amplitude for input3
editamp3 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
		'ListboxTop',0, ...
    'Enable','off',...
	'Position',[196.75 155.75 38.25 16.5], ...
	'String','0', ...
	'Style','edit', ...
	'Tag','EditText1');
txtamp3 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'ListboxTop',0, ...
   'Enable','off',...
	'Position',[196.75 172.25 41.25 13.5], ...
	'String','Amplitude', ...
	'Style','text', ... 
	'Tag','StaticText1');
% end amplitude for input3

% duration for input3
editdur3 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
		'ListboxTop',0, ...
	'Position',[196.75 114 38.25 16.5], ...
	'Enable','off',...
    'String','0', ...
	'Style','edit', ...
	'Tag','EditText1');
txtdur3 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
   'Enable','off',...
	'ListboxTop',0, ...
	'Position',[194 134.5 41.25 10.5], ...
	'String','Duration:', ...
	'Style','text', ...
	'Tag','StaticText1');
% end duration for input3

% Application time for input3
editapp3 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
		'ListboxTop',0, ...
	'Position',[196.25 75.75 38.25 16.5], ...
   'String','0', ...
   'Enable','off',...
	'Style','edit', ...
	'Tag','EditText1');
txtapp3 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'ListboxTop',0, ...
	'Position',[185.25 95.5 61.25 10.5], ...
	'String','Application time', ...
   'Enable','off',...
	'Style','text', ...
	'Tag','StaticText1');
% end application time for input3

% --------------------------------------------------------input4--------------------------------
% amplitude for input4
editamp4 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
		'ListboxTop',0, ...
    'Enable','off',...
	'Position',[286.75 155.75 38.25 16.5], ...
	'String','0', ...
	'Style','edit', ...
	'Tag','EditText1');
txtamp4 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'ListboxTop',0, ...
   'Enable','off',...
	'Position',[286.75 172.25 41.25 13.5], ...
	'String','Amplitude', ...
	'Style','text', ... 
	'Tag','StaticText1');
% end amplitude for input4

% duration for input4
editdur4 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
		'ListboxTop',0, ...
	'Position',[286.75 114 38.25 16.5], ...
	'Enable','off',...
    'String','0', ...
	'Style','edit', ...
	'Tag','EditText1');
txtdur4 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
   'Enable','off',...
	'ListboxTop',0, ...
	'Position',[284 134.5 41.25 10.5], ...
	'String','Duration:', ...
	'Style','text', ...
	'Tag','StaticText1');
% end duration for input4

% Application time for input4
editapp4 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
		'ListboxTop',0, ...
	'Position',[286.25 75.75 38.25 16.5], ...
   'String','0', ...
   'Enable','off',...
	'Style','edit', ...
	'Tag','EditText1');
txtapp4 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'ListboxTop',0, ...
	'Position',[275.25 95.5 61.25 10.5], ...
	'String','Application time', ...
   'Enable','off',...
	'Style','text', ...
	'Tag','StaticText1');
% end application time for input4

% --------------------------------------------------------input5--------------------------------
% amplitude for input5
editamp5 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
		'ListboxTop',0, ...
    'Enable','off',...
	'Position',[376.75 155.75 38.25 16.5], ...
	'String','0', ...
	'Style','edit', ...
	'Tag','EditText1');
txtamp5 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'ListboxTop',0, ...
   'Enable','off',...
	'Position',[376.75 172.25 41.25 13.5], ...
	'String','Amplitude', ...
	'Style','text', ... 
	'Tag','StaticText1');
% end amplitude for input5

% duration for input5
editdur5 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
		'ListboxTop',0, ...
	'Position',[376.75 114 38.25 16.5], ...
	'Enable','off',...
    'String','0', ...
	'Style','edit', ...
	'Tag','EditText1');
txtdur5 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
   'Enable','off',...
	'ListboxTop',0, ...
	'Position',[374 134.5 41.25 10.5], ...
	'String','Duration:', ...
	'Style','text', ...
	'Tag','StaticText1');
% end duration for input5

% Application time for input5
editapp5 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
		'ListboxTop',0, ...
	'Position',[376.25 75.75 38.25 16.5], ...
   'String','0', ...
   'Enable','off',...
	'Style','edit', ...
	'Tag','EditText1');
txtapp5 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'ListboxTop',0, ...
	'Position',[365.25 95.5 61.25 10.5], ...
	'String','Application time', ...
   'Enable','off',...
	'Style','text', ...
	'Tag','StaticText1');
% end application time for input5

% --------------------------------------------------------input6--------------------------------
% amplitude for input6
editamp6 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
		'ListboxTop',0, ...
    'Enable','off',...
	'Position',[466.75 155.75 38.25 16.5], ...
	'String','0', ...
	'Style','edit', ...
	'Tag','EditText1');
txtamp6 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'ListboxTop',0, ...
   'Enable','off',...
	'Position',[466.75 172.25 41.25 13.5], ...
	'String','Amplitude', ...
	'Style','text', ... 
	'Tag','StaticText1');
% end amplitude for input6

% duration for input6
editdur6 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
		'ListboxTop',0, ...
	'Position',[466.75 114 38.25 16.5], ...
	'Enable','off',...
    'String','0', ...
	'Style','edit', ...
	'Tag','EditText1');
txtdur6 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
   'Enable','off',...
	'ListboxTop',0, ...
	'Position',[464 134.5 41.25 10.5], ...
	'String','Duration:', ...
	'Style','text', ...
	'Tag','StaticText1');
% end duration for input6

% Application time for input6
editapp6 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
		'ListboxTop',0, ...
	'Position',[466.25 75.75 38.25 16.5], ...
   'String','0', ...
   'Enable','off',...
	'Style','edit', ...
	'Tag','EditText1');
txtapp6 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'ListboxTop',0, ...
	'Position',[455.25 95.5 61.25 10.5], ...
	'String','Application time', ...
   'Enable','off',...
	'Style','text', ...
	'Tag','StaticText1');
% end application time for input6
