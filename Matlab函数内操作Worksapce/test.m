function test
test.a=1;test.b=2;
assignin('base','Param',test);
evalin('base','Param.a=Param.a+1;');
value=evalin('base','Param.a');
disp(value);
sim('a');
end