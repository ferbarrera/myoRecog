function [ vec_envolvente ] = d_envolvente( vec_senal )
%Funcion para calcular la envolvente de una señal EMG

vec_envolvente = abs (hilbert(vec_senal)); %Saca la transformada de fourier, invierte y desfasa 90 grados, 
                              %(señal entrada de alta frecuencia), señal de
                              %salida de baja frecuencia, ,enos vulnerable
                              %al ruido
                              
                              
                              
end

