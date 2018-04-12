%% init
clear all
clc
close all

%% argumento de entrada
data_path= 'C:\Users\Rocio\Documents\UAN\TIG\Nueva carpeta\data\cerrar2.txt';

%% operations 

[vec_data]  = readData( data_path ); %%Lee un archivo
vec =vec_data(:,1:4);  %se recorta la matrix de 8*100 a 4*100, valores enteros que no necesitan
vec1 = vec';%% invierte el vector de columna  a fila
vec2=vec1(:); %%convierte un matriz en un vector
figure , 
plot (vec2); %%Muestra grafica
title ('EMG')
%% segmentacion matrix

%  [x,y]=ginput(2);
%   vec3 =vec2(x(1):x(2)); %% crea un nuevo vector con los valores desde el inicia x hasta final x1

%% funcion para encoontrar cruces por cero, entrada es el vector recortado matrix a

% cruces=crZero(vec3);
%disp (l) %% muestra el valor de los cruces

%% funciona para encpontrar la envolvente de una señal
% envol_ori= d_envolvente(vec2);% en una nueva variable se toma el valor del vector segmentado que se envia a la funcion
% figure(2)
% hold on ;  %sirve para graficar una grafica nueva, junto al plot anterior
% plot (vec2);
% plot (envol_ori);
%title ('EMG ENVOLVENTE')

%% promedio

% prom=signalAverage(vec2); %- calcula el promedio de la señal y lo resta
                            % con la original para elinar el offset
%vec_of=vec2-prom;

%% ventaneo deslizante de la señal original, (calcula potencia)
window=7; %- tamñaño ventana deslizante
pot=potencia(vec2,window); 
figure(3); plot(pot)
title ('EMG POTENCIA (RECORTADA)')
%% se determina el umbral para discrimacion de movimiento 
reposo=pot<0.1; %- se determina el tamaño umbral 
vec_reposo=pot; % se crea una copia del vector original
vec_reposo(reposo)=0; % reemplazaba los valores debajo de umbral en 0 y los otros 
                       % valores quedan normales

%% calcula la envolvente de la señal ventaneada (potencia)

envolt=d_envolvente(vec_reposo);
figure(4)
hold on;
plot(vec_reposo)
plot(envolt);
title ('EMG ENVOLVENTE POTENCIA')
%% suavizado de la señal 
sua_vec5=smooth(vec2);
figure(5)
plot(vec2)
hold on 
plot(sua_vec5)
title ('EMG SUAVIZADO')
%% Eliminacion de valores atipicos

vec6=medfilt1(vec2,2); %- crea un Filtrado mediano unidimensional de orden uno
figure(6)
hold on;
subplot (2,1,1)
plot(vec2)
title ('EMG ELIMINACION VALORES ATIPICOS')
subplot (2,1,2)
plot(vec6)
