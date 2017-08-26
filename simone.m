%function simone = simone(Id,maxtime)

% Function for simulating the temporal response of a nerve cell membrane
% for an applied current of Id at t=0 for a period of T miliseconds.
%
% simone(gNa,gK,gl,ENa,EK,El,Cm,Id,T,gNaRest,gKrest,tstep)
% 
%----------------------------------------------------------------
% gNa and gK ===> maximum cell membrane conductivities for Na and K
% gl         ===> the conductivity due to leakeage (or Calcium)
% ENa,EK,El  ===> nernst potentials of Na,K and Ca (leakage) in milivolts
% Cm         ===> membrane capacitance in microfarads
% Id         ===> amplitude of the applied current in miliamps
% T          ===> the duration for applied current in miliseconds
% tstep      ===> the step size of t for the simulation in miliseconds
%-----------------------------------------------------------------
Id=amparray;                
maxtime=maxtime;
tstep=0.05;
time=linspace(0,maxtime,round(maxtime/tstep));         %the value 200 is the entire simulation time in miliseconds and can be changed
                                        %if so, 201 must be arranged accordingly one second is divided into tstep intervals
vm=zeros(size(time));

Vm=-90;                              %initialize the nerve potential to its resting value. i.e, simulation starts from rest
vm(1)=Vm+90+0.1;
gK=36;
gNa=120;
gl=0.3;
ENa=115;
EK=-12;
El=10.6;
Cm=1;
        % Initialization for alphas,betas and conductances (i.e. for vm=0)
        alphan=0.1/(exp(1)-1);
        betan=0.125;
    
        alpham=0.1*(25/(exp(2.5)-1));   
        betam=4;
    
        alphah=0.07;     
        betah=1/(exp(3)+1);
        
        n=alphan/(alphan+betan);
        m=alpham/(alpham+betam);
        h=alphah/(alphah+betah);
        GK=gK*h*m^3;
        GNA=gNa*n^4;
        IL(1)=0;           %for plotting Leakage current
        INA(1)=0;          %for plotting Sodium current
        IK(1)=0;           %for plotting Potasium current
        IC(1)=0;           %for plotting capacitive current
        IT(1)=0;           %for plotting Total membrane current 
        
        % End for initialization
        
    wait=waitbar(0,'Processing for every time instant...');    
        
    % Start of the iteration loop
    for i=1:round(maxtime/tstep)
        
        vmdiffer=tstep/Cm*(Id(i) - gK*n^4*(vm(i)-EK) - gNa*h*m^3*(vm(i)-ENa) - gl*(vm(i)-El));
        vm(i+1)=vm(i)+vmdiffer; 
        
        
       %Update alpha and beta values
        alphan=0.01*(10-vm(i+1))/ (exp( (10- vm(i+1) )/10) -1);
        betan=0.125*exp(-vm(i+1)/80);
    
        alpham=0.1*(25-vm(i+1))/(exp((25-vm(i+1))/10)-1);
        betam=4*exp(-vm(i+1)/18);
    
        alphah=0.07*exp(-vm(i+1)/20);     %Vm-ENa meselesinde bi problem var
        betah=1/(exp((30-vm(i+1))/10)+1);
        % end for alpha and beta updating
     
       
        % update n,m,and h
        n=n+tstep*(alphan*(1-n)-betan*n);  %Differential eqns for m ,n  and h are implemented here
        m=m+tstep*(alpham*(1-m)-betam*m);
        h=h+tstep*(alphah*(1-h)-betah*h);
        %end for updating n,m, and h
        
        GK(i+1)=gK*n^4;                 % Used to display gK change in time
        GNA(i+1)=gNa*h*m^3;             % Used to display gNa change in time 
        IL(i)=gl*(vm(i)-El);
        INA(i)=gNa*h*m^3*(vm(i)-ENa);
        IK(i)=gK*n^4*(vm(i)-EK);
        IT(i)=gK*n^4*(vm(i)-EK) + gNa*h*m^3*(vm(i)-ENa) + gl*(vm(i)-El);
        IC(i)=Cm*vmdiffer/tstep;
        
        waitbar(i/round(maxtime/tstep),wait,'Processing for every time instant');
    end
    
Vm=vm-90;
[en,boy]=size(Vm);

close all
giris
set(txtexplain,'Visible','off');
set(txtwarn,'Visible','off');
set(hndl.ax,'Visible','on');
set(hndl2.ax,'Visible','on');
set(txttime,'Visible','on');


axis([0 length(time)/20 -100 20])
subplot(hndl.ax)
plot(linspace(0,maxtime,boy),Vm),title('Membrane Voltage (mV)');
zoom on,
subplot(hndl2.ax)
plot(linspace(0,maxtime,boy),GK,'r' ),title('Potassium (red), Sodium (green) and Leakage (blue) Conductances   (mS/cm^2)');
zoom on,
hold on,
plot(linspace(0,maxtime,boy),GNA,'g');
hold on,
zoom on,
plot(linspace(0,maxtime,boy),gl*ones(1,boy));
zoom on,

figure('Color',[1 1 1],'Position',[50 25 750 700]),
axis([0 length(time)/20 -100 20])
subplot(3,1,1)
plot(linspace(0,maxtime,boy-1),Id,'b'),title('Input Current (mAmps)')
zoom on,
[en,boy]=size(IL);
subplot(3,1,2)
plot(linspace(0,maxtime,boy),IL,'b'),title('Potassium (red), Sodium (green), leakage (blue) & Currents      (microAmps)');
hold on,
zoom on,
plot(linspace(0,maxtime,boy),IK,'r' );
hold on,
zoom on,
plot(linspace(0,maxtime,boy),INA,'g');
hold on,
zoom on,
subplot(3,1,3)
plot(linspace(0,maxtime,boy),IT,'k'),title('Capacitive (red) & Total Membrane (black) Currents      (microAmps)'),xlabel('time (ms)');
zoom on,
hold on,
plot(linspace(0,maxtime,boy),IC,'r' );



   