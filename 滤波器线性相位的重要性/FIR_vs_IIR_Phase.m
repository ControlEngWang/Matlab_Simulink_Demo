Ts=1.0e-2;
f1=tf([-0.0634928461129857,0.181166874987007,0.427861562380551,0.427861562380551,0.181166874987007,-0.0634928461129857],1,Ts,'variable','z^-1');
f2=tf([1,0.909500612723603,1]*0.201104578121353,[1,-0.768267803042833,0.424776389155304],Ts);

figure;
freq=1:0.5:1/Ts/2;
resp1=squeeze(freqresp(f1,2*pi*freq));
resp2=squeeze(freqresp(f2,2*pi*freq));
subplot(211);semilogx(freq,20*log10(abs(resp1)));grid on;hold on;subplot(212);semilogx(freq,angle(resp1));grid on;hold on;
subplot(211);semilogx(freq,20*log10(abs(resp2)));grid on;hold on;subplot(212);semilogx(freq,angle(resp2));grid on;hold on;

freq_s=[5,15];
ap_s=[1,0.6];
t_sim=0:Ts:10;
u=zeros(size(t_sim));
for i=1:length(freq_s)
    u = u+ap_s(i)*sin(2*pi*freq_s(i)*t_sim);
end
y1=lsim(f1,u,t_sim);
y2=lsim(f2,u,t_sim);
figure;
plot(t_sim,u,t_sim,y1,t_sim,y2);
