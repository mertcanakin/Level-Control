clc;clear;
% qin=0.0011566536; %(m^3/s) akt�at�r maksimum debi de�eri
% qin=1.933e-4*0.5; %(m^3/s) akt�at�r maksimum debi de�eri
qin=0.000087083333
C=(pi*(100*10^-3)^2)/4 %(m^2) kapasitans -tank taban alan�-
ks=0; %(m)absolute roughnes height(equivalent sand roughness height)
D=(12.7*10^-3); %(m)��k�� boru �ap�
L=0.65;% toplam boru uzunlu�u
g=9.81 %(m^2/s) yer�ekimi ivmesi
v=10^(-6); %  kinematik viskozite
f=5 %iterasyon i�in f(Resistance coefficient) de�eri
h=0.225 %(m) tank s�v� seviyesi
Kb=0.9; Ke= 0.5; Kv= 278; Kc=0.27 ; KE=0 ; %(Kv vana)(Kc boru daralma)(KE boru geni�leme)(Ke tanktan giri�) sistem elemanlar K de�erleri
a=0 ; %kontrol tank� ��k���ndaki 90 derece dirsek say�s�
z0=0.65; %kontrol tank� ��k��� ana tank bo�altma noktas� aras�ndaki dikey mesafe
z1=z0+h;kd=0; 
%kontrolc� de�erleri
% ---------------------------
% iterasyon
for k=1:1:10
V=sqrt((2*g*D*z1)/(D+L*f+D*(Ke+a*Kb+Kv+Kc+KE))) %denklem sisteme g�re d�zenlenmelidir bu denklemde
%tank taban�ndaki yatay bir metre borulamaya g�re olu�turulmu�tur 
Re=(V*D)/v % Reynolds say�s�
f=0.25/(log10((ks/(3.74*D))+(5.74/(Re)^0.9)))^2 % Colebrook Equation (turb�lans ak�� i�in) 
%  f=64/Re  %(laminar ak�� i�in)

end
%iterasyon sonucunda sistem R ve qo de�erlerinin elde edilmesi
qo=(V*(pi*D^2)/4);  % kararl� hal ��k�� debisi


 R=(h)/qo;%sistem diren� de�eri t�rb�lans durum i�in




P=7.08;td=0.56;ti=2.25;  %kontrolc� de�erleri
run PIDsim.slx
sim('PIDsim.slx')
subplot(3,2,1)
plot(tout,yout.signals.values,'linewidth',2,'Color','b')
title('P=7.08/td=0.56/ti=2.25','fontsize',14)
x=importdata('otomatik_pid_deger.csv')
for i=1:1:14
x.data(1,:)=[]        %d�zensiz b�lgenin ��kar�lmas� i�in
i=i+1
end
x.data(:,2)=(x.data(:,2)*(1/1000))
x.data(:,2)=x.data(:,2)-x.data(1,2)  %y�kseli� zaman�n�n ba�lang�c�n�n s�f�ra �ekilmsi i�in
x.data(:,4)=x.data(:,4)*(22.5/8000)  
hold on
plot(x.data(:,2),x.data(:,4),'linewidth',2,'Color','r')
hold on;
plot([0,70],[h,h],'--','Color','k') % setpoint �izgisi
xlabel('Zaman (s)')
ylabel('h (m)')
% ---------------------------------------------------
P=24.3;td=0;ti=2.757;   %kontrolc� de�erleri
sim('PIDsim.slx')
subplot(3,2,2)
plot(tout,yout.signals.values,'linewidth',2,'Color','b')
title('P=24.3/ti=2.757','fontsize',14)
x=importdata('pi.csv')
for i=1:1:27
x.data(1,:)=[]        %d�zensiz b�lgenin ��kar�lmas� i�in
i=i+1
end
x.data(:,2)=(x.data(:,2)*(1/1000))
x.data(:,2)=x.data(:,2)-x.data(1,2)   %y�kseli� zaman�n�n ba�lang�c�n�n s�f�ra �ekilmsi i�in
x.data(:,4)=x.data(:,4)*(22.5/8000)  
hold on
plot(x.data(:,2),x.data(:,4),'linewidth',2,'Color','r')
hold on;
plot([0,70],[h,h],'--','Color','k') % setpoint �izgisi
xlabel('Zaman (s)')
ylabel('h (m)')


% ---------------------------------------------------



P=7.08;td=0.56;   %kontrolc� de�erleri
run P_PDsim.slx
sim('P_PDsim.slx')
subplot(3,2,4)
plot(tout,yout.signals.values,'linewidth',2,'Color','b')
title('P=31.025/td=0.01','fontsize',14)
x=importdata('PD_31.025_0.01.csv')
for i=1:1:22
x.data(1,:)=[]        %d�zensiz b�lgenin ��kar�lmas� i�in
i=i+1
end
x.data(:,2)=(x.data(:,2)*(1/1000))
x.data(:,2)=x.data(:,2)-x.data(1,2) %y�kseli� zaman�n�n ba�lang�c�n�n s�f�ra �ekilmsi i�in
x.data(:,4)=x.data(:,4)*(22.5/8000)  
hold on
plot(x.data(:,2),x.data(:,4),'linewidth',2,'Color','r')
hold on;
plot([0,70],[h,h],'--','Color','k') % setpoint �izgisi
xlabel('Zaman (s)')
ylabel('h (m)')


% ---------------------------------------------------



P=7.08;td=0.56;    %kontrolc� de�erleri
sim('P_PDsim.slx')
subplot(3,2,3)
plot(tout,yout.signals.values,'linewidth',2,'Color','b')
title('P=7.08/td=0.56','fontsize',14)
x=importdata('PD_7.08.csv')
for i=1:1:22
x.data(1,:)=[]        %d�zensiz b�lgenin ��kar�lmas� i�in
i=i+1
end
x.data(:,2)=(x.data(:,2)*(1/1000))
x.data(:,2)=x.data(:,2)-x.data(1,2)  %y�kseli� zaman�n�n ba�lang�c�n�n s�f�ra �ekilmsi i�in
x.data(:,4)=x.data(:,4)*(22.5/8000)  
hold on
plot(x.data(:,2),x.data(:,4),'linewidth',2,'Color','r')
hold on;
plot([0,70],[h,h],'--','Color','k') % setpoint �izgisi
xlabel('Zaman (s)')
ylabel('h (m)')
% ---------------------------------------------------



P=7.08;td=0.56;     %kontrolc� de�erleri
sim('P_PDsim.slx')
subplot(3,2,5)
plot(tout,yout.signals.values,'linewidth',2,'Color','b')
title('P=7.08','fontsize',14)
x=importdata('P_7.08.csv')
for i=1:1:18
x.data(1,:)=[]        %d�zensiz b�lgenin ��kar�lmas� i�in
i=i+1
end
x.data(:,2)=(x.data(:,2)*(1/1000))
x.data(:,2)=x.data(:,2)-x.data(1,2)  %y�kseli� zaman�n�n ba�lang�c�n�n s�f�ra �ekilmsi i�in
x.data(:,4)=x.data(:,4)*(22.5/8000)  
hold on
plot(x.data(:,2),x.data(:,4),'linewidth',2,'Color','r')
hold on;
plot([0,70],[h,h],'--','Color','k') % setpoint �izgisi
xlabel('Zaman (s)')
ylabel('h (m)')
% ---------------------------------------------------



P=7.08;td=0.56;    %kontrolc� de�erleri
sim('P_PDsim.slx')
subplot(3,2,6)
plot(tout,yout.signals.values,'linewidth',2,'Color','b')
title('P=30','fontsize',14)
x=importdata('P_30.csv')
for i=1:1:20
x.data(1,:)=[]        %d�zensiz b�lgenin ��kar�lmas� i�in
i=i+1
end
x.data(:,2)=(x.data(:,2)*(1/1000))
x.data(:,2)=x.data(:,2)-x.data(1,2)  %y�kseli� zaman�n�n ba�lang�c�n�n s�f�ra �ekilmsi i�in
x.data(:,4)=x.data(:,4)*(22.5/8000)  
hold on
plot(x.data(:,2),x.data(:,4),'linewidth',2,'Color','r')
hold on;
plot([0,70],[h,h],'--','Color','k') % setpoint �izgisi
xlabel('Zaman (s)')
ylabel('h (m)')



