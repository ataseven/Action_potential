

% function for calculating athe membrane voltages for each node et every time step
% 
%   a         ==>     the cell radius when the cell is considered to be cylindrical  
%   numnodes  ==>     the number of the nodes for the cell
%   I         ==>     input current array of length (# of time steps)


I=-amparray; %in mA
numnodes=40;

Vrest=-90;           % in milivolts

[boy en]=size(I);       % boy=1, en=># of time steps
Vm=zeros(numnodes,en);   % construct the Vm matrix (keeps membrane voltages for each node at every time step)
vm=Vm;
vm(:,1)=0.1;
Vm(:,1)=Vrest;
Itot=I;
ri=ri+ro; 

gK=36;
gNa=120;
gl=0.3;
ENa=115;
EK=-12;
El=10.6;
Cm=1;  %in microfarads/cm
Ri=pi*a^2*ri;   %in ohms*cm
cm=Cm*2*pi*a;   %in microfarads
deltax=0.01;    %%%% in cm
tstep=0.05;  %%%% in miliseconds

mesh_ratio=tstep*0.001/(ri*cm*10^(-6)*deltax^2)

n=0.3177*ones(numnodes,1);         %initial n for every node
m=0.0529*ones(numnodes,1);         %initial m every node
h=0.5961*ones(numnodes,1);         % initial h every node

tic

wait=waitbar(0,'Processing...');
for i=1:en          %for every time instant
    Itot=I(i)+gK*n(1,i)^4*(vm(1,i)-EK)+ gNa*h(1,i)*m(1,i)^3*(vm(1,i)-ENa) + gl*(vm(1,i)-El);  %total membrane current for node 1
    vmdiffer=a*tstep/2/Ri/Cm*((Vm(2,i)-2*Vm(1,i)+Vm(2,i))/(deltax^2))-tstep*Itot/Cm;  %delta Vm for node 1
    Vm(1,i+1)=Vm(1,i)+vmdiffer;     %new Vm for node 1
    vm(1,i+1)=Vm(1,i+1)+90;         % new vm for node 1
    
     %   update alpha values for each node   
   alpham=(0.1*(25-vm(1,i+1)))/(exp((25-vm(1,i+1))/10)-1);
   alphan=(0.01*(10-vm(1,i+1)))/(exp((10-vm(1,i+1))/10)-1);
   alphah=0.07*exp(-vm(1,i+1)/20);

   %   update beta values for each node
   betam=4*exp(-vm(1,i+1)/18);
   betan=0.125*exp(-vm(1,i+1)/80);
   betah=1/(exp((30-vm(1,i+1))/10)+1);
   
   % new n,m and h for the next time for each node
   m(1,i+1)=m(1,i)+tstep*(alpham*(1-m(1,i))-betam*m(1,i));   % x1000 ne yaaaaa?
   n(1,i+1)=n(1,i)+tstep*(alphan*(1-n(1,i))-betan*n(1,i));
   h(1,i+1)=h(1,i)+tstep*(alphah*(1-h(1,i))-betah*h(1,i));
    
    for j=2:numnodes-1 %for every node except for the last node   
        Itot=gK*n(j,i)^4*(vm(j,i)-EK)+ gNa*h(j,i)*m(j,i)^3*(vm(j,i)-ENa) + gl*(vm(j,i)-El);  %total membrane current for every node
            
        vmdiffer=a*tstep/2/Ri/Cm*((vm(j-1,i)-2*vm(j,i)+vm(j+1,i))/deltax^2)-tstep*Itot/Cm;  %delta Vm for node 1
        
        Vm(j,i+1)=Vm(j,i)+vmdiffer; % new Vm for every node
        vm(j,i+1)=Vm(j,i+1)+90; % new vm for every node
        
               
   %   update alpha values for each node   
   alpham=(0.1*(25-vm(j,i+1)))/(exp((25-vm(j,i+1))/10)-1);
   alphan=(0.01*(10-vm(j,i+1)))/(exp((10-vm(j,i+1))/10)-1);
   alphah=0.07*exp(-vm(j,i+1)/20);

   %   update beta values for each node
   betam=4*exp(-vm(j,i+1)/18);
   betan=0.125*exp(-vm(j,i+1)/80);
   betah=1/(exp((30-vm(j,i+1))/10)+1);
   
   % new n,m and h for the next time for each node
   m(j,i+1)=m(j,i)+tstep*(alpham*(1-m(j,i))-betam*m(j,i));   % x1000 ne yaaaaa?
   n(j,i+1)=n(j,i)+tstep*(alphan*(1-n(j,i))-betan*n(j,i));
   h(j,i+1)=h(j,i)+tstep*(alphah*(1-h(j,i))-betah*h(j,i));
        
    end
      Itot=gK*n(numnodes,i)^4*(vm(numnodes,i)-EK)+ gNa*h(numnodes,i)*m(numnodes,i)^3*(vm(numnodes,i)-ENa) + gl*(vm(numnodes,i)-El);  %total membrane current for the last node
      vmdifferlast=a*tstep/2/Ri/Cm*((Vm(numnodes-1,i)-Vm(numnodes,i))/deltax^2)-tstep*Itot/Cm;  %delta Vm for the last node
      
      Vm(numnodes,i+1)=Vm(numnodes,i)+vmdifferlast; %New vm for the last node
      vm(numnodes,i+1)=Vm(numnodes,i+1)+90; %new vm for the last node
      
      %   update alpha values for each node   
   alpham=(0.1*(25-vm(numnodes,i+1)))/(exp((25-vm(numnodes,i+1))/10)-1);
   alphan=(0.01*(10-vm(numnodes,i+1)))/(exp((10-vm(numnodes,i+1))/10)-1);
   alphah=0.07*exp(-vm(numnodes,i+1)/20);

   %   update beta values for each node
   betam=4*exp(-vm(numnodes,i+1)/18);
   betan=0.125*exp(-vm(numnodes,i+1)/80);
   betah=1/(exp((30-vm(numnodes,i+1))/10)+1);
   
   % new n,m and h for the next time for each node
   m(numnodes,i+1)=m(numnodes,i)+tstep*(alpham*(1-m(numnodes,i))-betam*m(numnodes,i));   % x1000 ne yaaaaa?
   n(numnodes,i+1)=n(numnodes,i)+tstep*(alphan*(1-n(numnodes,i))-betan*n(numnodes,i));
   h(numnodes,i+1)=h(numnodes,i)+tstep*(alphah*(1-h(numnodes,i))-betah*h(numnodes,i));
   
   waitbar(i/en,wait,'Processing for every instant...');
   
end
close(wait)
toc;
close all
giris
set(editri,'Visible','off');
set(txtexplain,'Visible','off');
%set(txtri,'String','nodes ','Enable','on','Position',[205.75 197 39.5 26.25]);
set(hndl.pause,'Visible','on','Enable','on');
set(hndl.stop,'Visible','on','Enable','on');
looping=1;
while (looping)     %for looping the simulation untill the stop button pressed
        set(h0,'Pointer','arrow');
hndl.ax = axes('Parent',h0, ...
	'Units','pixels', ...
	'CameraUpVector',[0 1 0], ...
	'CameraUpVectorMode','manual', ...
	'Color',[1 1 1], ...
	'Position',[97 369 566 302], ...
	'Tag','Axes1', ...
	'XColor',[0 0 0], ...
	'YColor',[0 0 0], ...
	'ZColor',[0 0 0]);

for i=1:80:en
    if looping
        set(txtpause,'Visible','off');
        set(h0,'Pointer','arrow');
        subplot(hndl.ax);
        plot(Vm(1:numnodes,i))
        axis([0 numnodes -120 20])
        set(h0,'Pointer','arrow');
        set(txtwarn,'String',['time(ms):' num2str(i/50)]);
        pause(0.05)
    end
end
end
