clc;clear;
qin=0.000087083333; C=(pi*(100*10^-3)^2)/4 ;ks=0;
D=(12.7*10^-3);L=0.65;g=9.81;v=10^(-6);
h=0.225 ;z0=0.65;z1=z0+h; 
Ke= 0.5; Kv= 277; Kc=0.27 ; KE=1 ;
f=5; %iterasyon i�in f(Resistance coefficient) de�eri
% iterasyon
for k=1:1:10;
V=sqrt((2*g*D*z1)/(D+L*f+D*(Ke+Kv+Kc+KE)));
Re=(V*D)/v; % Reynolds say�s�
if Re > 2300;
f=0.25/(log10((ks/(3.74*D))+(5.74/(Re)^0.9)))^2; % Colebrook Equation (turb�lans ak�� i�in) 
else
 f=64/Re ; %(laminar ak�� i�in)
end
end
qo=(V*(pi*D^2)/4);  % kararl� hal ��k�� debisi
R=(h)/qo;  %sistem diren� de�eri





figure (1)
P=7.08;td=0.56;ti=2.25;  %kontrolc� de�erleri
run PIDsim.slx;
sim('PIDsim.slx');
subplot(3,2,1);
hold on;
plot(tout,yout.signals.values,'linewidth',2,'Color','b');
title('P=7.08 | td=0.56 | ti=2.25','fontsize',14);
x=importdata('otomatik_pid_deger.csv');
for i=1:1:14;
x.data(1,:)=[] ;       %d�zensiz b�lgenin ��kar�lmas� i�in
i=i+1;
end
x.data(:,2)=(x.data(:,2)*(1/1000));
x.data(:,2)=x.data(:,2)-x.data(1,2);  %y�kseli� zaman�n�n ba�lang�c�n�n s�f�ra �ekilmsi i�in
x.data(:,4)=x.data(:,4)*(22.5/8000);  
hold on
plot(x.data(:,2),x.data(:,4),'linewidth',2,'Color','r');
hold on;
plot([0,70],[h,h],'--','Color','k'); % setpoint �izgisi
xlabel('Zaman (s)');
ylabel('h (m)');



% ---------------------------------------------------
P=24.3;td=0;ti=2.757;   %kontrolc� de�erleri
sim('PIDsim.slx');
subplot(3,2,2);
hold on;
plot(tout,yout.signals.values,'linewidth',2,'Color','b');
title('P=24.3 | ti=2.757','fontsize',14);
x=importdata('pi.csv');
for i=1:1:27;
x.data(1,:)=[];        %d�zensiz b�lgenin ��kar�lmas� i�in
i=i+1;
end
x.data(:,2)=(x.data(:,2)*(1/1000));
x.data(:,2)=x.data(:,2)-x.data(1,2);   %y�kseli� zaman�n�n ba�lang�c�n�n s�f�ra �ekilmsi i�in
x.data(:,4)=x.data(:,4)*(22.5/8000);  
hold on;
plot(x.data(:,2),x.data(:,4),'linewidth',2,'Color','r');
hold on;
plot([0,70],[h,h],'--','Color','k'); % setpoint �izgisi
xlabel('Zaman (s)');
ylabel('h (m)');





% ---------------------------------------------------



P=31.025;td=0.01;   %kontrolc� de�erleri
run P_PDsim.slx;
sim('P_PDsim.slx');
subplot(3,2,4);
hold on
plot(tout,yout.signals.values,'linewidth',2,'Color','b');
title('P=31.025 | td=0.01','fontsize',14);
x=importdata('PD_31.025_0.01.csv');
for i=1:1:22;
x.data(1,:)=[];        %d�zensiz b�lgenin ��kar�lmas� i�in
i=i+1;
end
x.data(:,2)=(x.data(:,2)*(1/1000));
x.data(:,2)=x.data(:,2)-x.data(1,2); %y�kseli� zaman�n�n ba�lang�c�n�n s�f�ra �ekilmsi i�in
x.data(:,4)=x.data(:,4)*(22.5/8000);  
hold on
plot(x.data(:,2),x.data(:,4),'linewidth',2,'Color','r');
hold on;
plot([0,70],[h,h],'--','Color','k'); % setpoint �izgisi
xlabel('Zaman (s)');
ylabel('h (m)');


% ---------------------------------------------------



P=7.08;td=0.56;    %kontrolc� de�erleri
sim('P_PDsim.slx');
subplot(3,2,3);
hold on
plot(tout,yout.signals.values,'linewidth',2,'Color','b');
title('P=7.08 | td=0.56','fontsize',14);
x=importdata('PD_7.08.csv');
for i=1:1:22;
x.data(1,:)=[] ;       %d�zensiz b�lgenin ��kar�lmas� i�in
i=i+1;
end
x.data(:,2)=(x.data(:,2)*(1/1000));
x.data(:,2)=x.data(:,2)-x.data(1,2);  %y�kseli� zaman�n�n ba�lang�c�n�n s�f�ra �ekilmsi i�in
x.data(:,4)=x.data(:,4)*(22.5/8000);  
hold on
plot(x.data(:,2),x.data(:,4),'linewidth',2,'Color','r');
hold on;
plot([0,70],[h,h],'--','Color','k'); % setpoint �izgisi
xlabel('Zaman (s)');
ylabel('h (m)');
% ---------------------------------------------------



P=7.08;td=0;     %kontrolc� de�erleri
sim('P_PDsim.slx');
subplot(3,2,5);
hold on;
plot(tout,yout.signals.values,'linewidth',2,'Color','b');
title('P=7.08','fontsize',14);
x=importdata('P_7.08.csv');
for i=1:1:18;
x.data(1,:)=[]  ;      %d�zensiz b�lgenin ��kar�lmas� i�in
i=i+1;
end
x.data(:,2)=(x.data(:,2)*(1/1000));
x.data(:,2)=x.data(:,2)-x.data(1,2);  %y�kseli� zaman�n�n ba�lang�c�n�n s�f�ra �ekilmsi i�in
x.data(:,4)=x.data(:,4)*(22.5/8000);  
hold on;
plot(x.data(:,2),x.data(:,4),'linewidth',2,'Color','r');
hold on;
plot([0,70],[h,h],'--','Color','k'); % setpoint �izgisi
xlabel('Zaman (s)');
ylabel('h (m)');


% ---------------------------------------------------



P=30;td=0;    %kontrolc� de�erleri
sim('P_PDsim.slx');
subplot(3,2,6);
hold on;
plot(tout,yout.signals.values,'linewidth',2,'Color','b');
title('P=30','fontsize',14);
x=importdata('P_30.csv');
for i=1:1:20;
x.data(1,:)=[] ;       %d�zensiz b�lgenin ��kar�lmas� i�in
i=i+1;
end
x.data(:,2)=(x.data(:,2)*(1/1000));
x.data(:,2)=x.data(:,2)-x.data(1,2);  %y�kseli� zaman�n�n ba�lang�c�n�n s�f�ra �ekilmsi i�in
x.data(:,4)=x.data(:,4)*(22.5/8000) ; 
hold on;
plot(x.data(:,2),x.data(:,4),'linewidth',2,'Color','r');
hold on;
plot([0,70],[h,h],'--','Color','k'); % setpoint �izgisi
xlabel('Zaman (s)');
ylabel('h (m)');
% --------------------------------**********
figure(2)
title('P=mavi PD=k�rm�z� PID=siyah','fontsize',14);

P=7.08;td=0;   %kontrolc� de�erleri
sim('P_PDsim.slx');
hold on;
plot(tout,yout.signals.values,'linewidth',2,'Color','b');
P=7.08;td=0;   %kontrolc� de�erleri

P=7.08;td=0.56;
sim('P_PDsim.slx');
hold on;
plot(tout,yout.signals.values,'linewidth',2,'Color','r');

P=7.08;td=0.56;ti=2.25;  %kontrolc� de�erleri
sim('PIDsim.slx');
hold on;
plot(tout,yout.signals.values,'linewidth',2,'Color','k');
hold on;
plot([0,70],[h,h],'--','Color','k'); % setpoint �izgisi
xlabel('Zaman (s)');
ylabel('h (m)');

% ----------------------------------------------

figure(3)
title('P=mavi PD=k�rm�z� PID=siyah','fontsize',14);
x=importdata('P_7.08.csv');
for i=1:1:18;
x.data(1,:)=[];        %d�zensiz b�lgenin ��kar�lmas� i�in
i=i+1;
end
x.data(:,2)=(x.data(:,2)*(1/1000));
x.data(:,2)=x.data(:,2)-x.data(1,2);  %y�kseli� zaman�n�n ba�lang�c�n�n s�f�ra �ekilmsi i�in
x.data(:,4)=x.data(:,4)*(22.5/8000);  
hold on
plot(x.data(:,2),x.data(:,4),'linewidth',2,'Color','b');

x=importdata('PD_7.08.csv');
for i=1:1:22;
x.data(1,:)=[] ;       %d�zensiz b�lgenin ��kar�lmas� i�in
i=i+1;
end
x.data(:,2)=(x.data(:,2)*(1/1000));
x.data(:,2)=x.data(:,2)-x.data(1,2) ; %y�kseli� zaman�n�n ba�lang�c�n�n s�f�ra �ekilmsi i�in
x.data(:,4)=x.data(:,4)*(22.5/8000)  ;
hold on
plot(x.data(:,2),x.data(:,4),'linewidth',2,'Color','r');

x=importdata('otomatik_pid_deger.csv');
for i=1:1:14;
x.data(1,:)=[]  ;      %d�zensiz b�lgenin ��kar�lmas� i�in
i=i+1;
end
x.data(:,2)=(x.data(:,2)*(1/1000));
x.data(:,2)=x.data(:,2)-x.data(1,2) ; %y�kseli� zaman�n�n ba�lang�c�n�n s�f�ra �ekilmsi i�in
x.data(:,4)=x.data(:,4)*(22.5/8000);  
hold on
plot(x.data(:,2),x.data(:,4),'linewidth',2,'Color','k');
hold on;
plot([0,70],[h,h],'--','Color','k'); % setpoint �izgisi
xlabel('Zaman (s)');
ylabel('h (m)');




