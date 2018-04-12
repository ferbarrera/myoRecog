clear all 
close all
clc
%%RED NEURONAL
x1=[0 1 1 0];
x2=[0 0 1 1];
y1=[1 0 1 0];

x={x1;x2};
net=feedforwardnet(1);%crear red neuronal con una sola neurona
net.numinputs=2;%numero de entradas de la red neuronal
net=configure(net,x)%configurar red 
net=train(net,x,y1);%entrenamiento
view(net)%visualizacion 