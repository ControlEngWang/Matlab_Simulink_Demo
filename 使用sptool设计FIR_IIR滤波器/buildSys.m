% sos,g 分布为导出IIR导出参数SOS,G
%
function sys=buildSys(sos,g,Ts)
sys=1;
size_sos=size(sos);
num_sys=size_sos(1);

for i=1:num_sys
    coeff=sos(i,:);
    tmp=tf(coeff(1:3),coeff(4:end),Ts,'variable','z^-1');
    sys=sys*tmp*g(i);
end

end