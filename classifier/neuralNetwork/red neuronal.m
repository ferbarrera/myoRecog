clear all 
close all
clc
%%RED NEURONAL
x1=[0 1 1 0];
x2=[0 0 1 1];
y1=[1 0 1 0];

x={x1;x2};
net=feeddorwardnet(1);
net.numimputs=2;
net=configure(net,x)
net=train(net,x,y1);
view(net)