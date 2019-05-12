clc;clear;
% qin=0.0011566536; %(m^3/s) aktüatör maksimum debi deðeri
% qin=1.933e-4*0.5; %(m^3/s) aktüatör maksimum debi deðeri
qin=0.000087083333
C=(pi*(100*10^-3)^2)/4 %(m^2) kapasitans -tank taban alaný-
ks=0; %(m)absolute roughnes height(equivalent sand roughness height)
D=(12.7*10^-3); %(m)çýkýþ boru çapý
L=0.65;% toplam boru uzunluðu
g=9.81 %(m^2/s) yerçekimi ivmesi
v=10^(-6); %  kinematik viskozite
f=5 %iterasyon için f(Resistance coefficient) deðeri
h=0.225 %(m) tank sývý seviyesi
Kb=0.9; Ke= 0.5; Kv= 278; Kc=0.27 ; KE=0 ; %(Kv vana)(Kc boru daralma)(KE boru geniþleme)(Ke tanktan giriþ) sistem elemanlar K deðerleri
a=0 ; %kontrol tanký çýkýþýndaki 90 derece dirsek sayýsý
z0=0.65; %kontrol tanký çýkýþý ana tank boþaltma noktasý arasýndaki dikey mesafe
z1=z0+h;kd=0; 
%kontrolcü deðerleri
% ---------------------------
% iterasyon
for k=1:1:10
V=sqrt((2*g*D*z1)/(D+L*f+D*(Ke+a*Kb+Kv+Kc+KE))) %denklem sisteme göre düzenlenmelidir bu denklemde
%tank tabanýndaki yatay bir metre borulamaya göre oluþturulmuþtur 
Re=(V*D)/v % Reynolds sayýsý
f=0.25/(log10((ks/(3.74*D))+(5.74/(Re)^0.9)))^2 % Colebrook Equation (turbülans akýþ için) 
%  f=64/Re  %(laminar akýþ için)

end
%iterasyon sonucunda sistem R ve qo deðerlerinin elde edilmesi
qo=(V*(pi*D^2)/4);  % kararlý hal çýkýþ debisi


 R=(h)/qo;%sistem direnç deðeri türbülans durum için




P=7.08;td=0.56;ti=2.25;  %kontrolcü deðerleri
run PIDsim.slx
sim('PIDsim.slx')
subplot(3,2,1)
plot(tout,yout.signals.values,'linewidth',2,'Color','b')
title('P=7.08/td=0.56/ti=2.25','fontsize',14)
x=importdata('otomatik_pid_deger.csv')
for i=1:1:14
x.data(1,:)=[]        %düzensiz bölgenin çýkarýlmasý için
i=i+1
end
x.data(:,2)=(x.data(:,2)*(1/1000))
x.data(:,2)=x.data(:,2)-x.data(1,2)  %yükseliþ zamanýnýn baþlangýcýnýn sýfýra çekilmsi için
x.data(:,4)=x.data(:,4)*(22.5/8000)  
hold on
plot(x.data(:,2),x.data(:,4),'linewidth',2,'Color','r')
hold on;
plot([0,70],[h,h],'--','Color','k') % setpoint çizgisi
xlabel('Zaman (s)')
ylabel('h (m)')
% ---------------------------------------------------
P=24.3;td=0;ti=2.757;   %kontrolcü deðerleri
sim('PIDsim.slx')
subplot(3,2,2)
plot(tout,yout.signals.values,'linewidth',2,'Color','b')
title('P=24.3/ti=2.757','fontsize',14)
x=importdata('pi.csv')
for i=1:1:27
x.data(1,:)=[]        %düzensiz bölgenin çýkarýlmasý için
i=i+1
end
x.data(:,2)=(x.data(:,2)*(1/1000))
x.data(:,2)=x.data(:,2)-x.data(1,2)   %yükseliþ zamanýnýn baþlangýcýnýn sýfýra çekilmsi için
x.data(:,4)=x.data(:,4)*(22.5/8000)  
hold on
plot(x.data(:,2),x.data(:,4),'linewidth',2,'Color','r')
hold on;
plot([0,70],[h,h],'--','Color','k') % setpoint çizgisi
xlabel('Zaman (s)')
ylabel('h (m)')


% ---------------------------------------------------



P=7.08;td=0.56;   %kontrolcü deðerleri
run P_PDsim.slx
sim('P_PDsim.slx')
subplot(3,2,4)
plot(tout,yout.signals.values,'linewidth',2,'Color','b')
title('P=31.025/td=0.01','fontsize',14)
x=importdata('PD_31.025_0.01.csv')
for i=1:1:22
x.data(1,:)=[]        %düzensiz bölgenin çýkarýlmasý için
i=i+1
end
x.data(:,2)=(x.data(:,2)*(1/1000))
x.data(:,2)=x.data(:,2)-x.data(1,2) %yükseliþ zamanýnýn baþlangýcýnýn sýfýra çekilmsi için
x.data(:,4)=x.data(:,4)*(22.5/8000)  
hold on
plot(x.data(:,2),x.data(:,4),'linewidth',2,'Color','r')
hold on;
plot([0,70],[h,h],'--','Color','k') % setpoint çizgisi
xlabel('Zaman (s)')
ylabel('h (m)')


% ---------------------------------------------------



P=7.08;td=0.56;    %kontrolcü deðerleri
sim('P_PDsim.slx')
subplot(3,2,3)
plot(tout,yout.signals.values,'linewidth',2,'Color','b')
title('P=7.08/td=0.56','fontsize',14)
x=importdata('PD_7.08.csv')
for i=1:1:22
x.data(1,:)=[]        %düzensiz bölgenin çýkarýlmasý için
i=i+1
end
x.data(:,2)=(x.data(:,2)*(1/1000))
x.data(:,2)=x.data(:,2)-x.data(1,2)  %yükseliþ zamanýnýn baþlangýcýnýn sýfýra çekilmsi için
x.data(:,4)=x.data(:,4)*(22.5/8000)  
hold on
plot(x.data(:,2),x.data(:,4),'linewidth',2,'Color','r')
hold on;
plot([0,70],[h,h],'--','Color','k') % setpoint çizgisi
xlabel('Zaman (s)')
ylabel('h (m)')
% ---------------------------------------------------



P=7.08;td=0.56;     %kontrolcü deðerleri
sim('P_PDsim.slx')
subplot(3,2,5)
plot(tout,yout.signals.values,'linewidth',2,'Color','b')
title('P=7.08','fontsize',14)
x=importdata('P_7.08.csv')
for i=1:1:18
x.data(1,:)=[]        %düzensiz bölgenin çýkarýlmasý için
i=i+1
end
x.data(:,2)=(x.data(:,2)*(1/1000))
x.data(:,2)=x.data(:,2)-x.data(1,2)  %yükseliþ zamanýnýn baþlangýcýnýn sýfýra çekilmsi için
x.data(:,4)=x.data(:,4)*(22.5/8000)  
hold on
plot(x.data(:,2),x.data(:,4),'linewidth',2,'Color','r')
hold on;
plot([0,70],[h,h],'--','Color','k') % setpoint çizgisi
xlabel('Zaman (s)')
ylabel('h (m)')
% ---------------------------------------------------



P=7.08;td=0.56;    %kontrolcü deðerleri
sim('P_PDsim.slx')
subplot(3,2,6)
plot(tout,yout.signals.values,'linewidth',2,'Color','b')
title('P=30','fontsize',14)
x=importdata('P_30.csv')
for i=1:1:20
x.data(1,:)=[]        %düzensiz bölgenin çýkarýlmasý için
i=i+1
end
x.data(:,2)=(x.data(:,2)*(1/1000))
x.data(:,2)=x.data(:,2)-x.data(1,2)  %yükseliþ zamanýnýn baþlangýcýnýn sýfýra çekilmsi için
x.data(:,4)=x.data(:,4)*(22.5/8000)  
hold on
plot(x.data(:,2),x.data(:,4),'linewidth',2,'Color','r')
hold on;
plot([0,70],[h,h],'--','Color','k') % setpoint çizgisi
xlabel('Zaman (s)')
ylabel('h (m)')



