sys=tf([1 1 1]/3,1,1e-3,'variable','z^-1')
freq=1:1:500;
resp=squeeze(freqresp(sys,2*pi*freq));
figure;
plot(freq,20*log10(abs(resp)),'DisplayName','Average 3');grid on;hold on;
sys=tf([1 1 1 1 1]/5,1,1e-3,'variable','z^-1')
resp=squeeze(freqresp(sys,2*pi*freq));
plot(freq,20*log10(abs(resp)),'DisplayName','Average 5');grid on;hold on;
sys=tf([0.8 1 1.4 1 0.8]/5,1,1e-3,'variable','z^-1')
resp=squeeze(freqresp(sys,2*pi*freq));
plot(freq,20*log10(abs(resp)),'DisplayName','Average 5 advance');grid on;hold on;