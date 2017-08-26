set(h0,'Pointer','arrow');
clear IL IT IK INA IC GK GNA Vm
amplitude1=str2num(get(editamp1,'String'));
amplitude2=str2num(get(editamp2,'String'));
amplitude3=str2num(get(editamp3,'String'));
amplitude4=str2num(get(editamp4,'String'));
amplitude5=str2num(get(editamp5,'String'));
amplitude6=str2num(get(editamp6,'String'));

duration1=round(str2num(get(editdur1,'String')));
duration2=round(str2num(get(editdur2,'String')));
duration3=round(str2num(get(editdur3,'String')));
duration4=round(str2num(get(editdur4,'String')));
duration5=round(str2num(get(editdur5,'String')));
duration6=round(str2num(get(editdur6,'String')));

apptime1=round(str2num(get(editapp1,'String')));
apptime2=round(str2num(get(editapp2,'String')));
apptime3=round(str2num(get(editapp3,'String')));
apptime4=round(str2num(get(editapp4,'String')));
apptime5=round(str2num(get(editapp5,'String')));
apptime6=round(str2num(get(editapp6,'String')));

ri=str2num(get(editri,'String'));
ro=str2num(get(editro,'String'));
a=str2num(get(edita,'String'));

number_nodes=30;

if apptime1<0
    amplitude1=0;
end
if apptime2<0
    amplitude2=0;
end
if apptime3<0
    amplitude3=0;
end
if apptime4<0
    amplitude4=0;
end
if apptime5<0
    amplitude5=0;
end
if apptime6<0
    amplitude6=0;
end

maxt=[apptime1+duration1 apptime2+duration2 apptime3+duration3 apptime4+duration4 apptime5+duration5 apptime6+duration6];
maxtime=30+max(maxt);
if maxtime<10
    maxtime=40;
end
amparray=zeros(1,20*maxtime);

if duration1 > 0
amparray(20*(apptime1)+1:20*(apptime1+duration1))=amparray(20*(apptime1)+1:20*(apptime1+duration1))+amplitude1;
end
if duration2 > 0
amparray(20*(apptime2)+1:20*(apptime2+duration2))=amparray(20*(apptime2)+1:20*(apptime2+duration2))+amplitude2;
end
if duration3 > 0
amparray(20*(apptime3)+1:20*(apptime3+duration3))=amparray(20*(apptime3)+1:20*(apptime3+duration3))+amplitude3;
end
if duration4 > 0
amparray(20*(apptime4)+1:20*(apptime4+duration4))=amparray(20*(apptime4)+1:20*(apptime4+duration4))+amplitude4;
end
if duration5 > 0
amparray(20*(apptime5)+1:20*(apptime5+duration5))=amparray(20*(apptime5)+1:20*(apptime5+duration5))+amplitude5;
end
if duration6 > 0
amparray(20*(apptime6)+1:20*(apptime6+duration6))=amparray(20*(apptime6)+1:20*(apptime6+duration6))+amplitude6;
end


if tercih==0
simone;
set(h0,'Pointer','arrow');
end
if tercih==1
    if maxtime<50
       maxtime=50;
       amparray=[amparray zeros(1,20*maxtime)]; 
   end
simtwo;
set(h0,'Pointer','arrow');
end