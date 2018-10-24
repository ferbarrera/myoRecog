function [ prom1 ] = signalAverage( varprom )
%PROMEDIO DE SEÑAL DE EMG
x=0;
for i=(1:(length(varprom)));
    x=varprom(i)+x;
    
    
end   
y=length(varprom);
    prom1=x/y;
end

