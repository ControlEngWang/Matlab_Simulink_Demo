% sys 为传递函数，freqs为频率(Hz)点
function plot_bode(sys,freqs)
resp=squeeze(freqresp(sys,2*pi*freqs));
subplot(211);semilogx(freqs,20*log10(abs(resp)));hold on;grid on;xlim([freqs(1),freqs(end)]);ylabel('Gain (dB)');
subplot(212);semilogx(freqs,angle(resp)*180/pi);hold on;grid on;xlim([freqs(1),freqs(end)]); xlabel('freqency (Hz) ');ylabel('Phase (deg)');
end