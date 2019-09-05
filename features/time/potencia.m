function [ signal_power ] = potencia(data_vec,window_sz )%data_vec: vector, widow_sz: ventana
%segmentacion

paddig_size=floor(window_sz/2);%paddig es el relleno tamaño

data_vec_pad=[zeros(paddig_size,1);data_vec(:);zeros(paddig_size,1)];% agregar zeros al vector queda en forma de columna 
signal_power=zeros(length(data_vec),1);
for i= (paddig_size+1):(length(data_vec)-paddig_size)%inicia desde el relleno mas uno hasta el tamaño del vector menos uno 
inicio= i-paddig_size;%incia desde i menos el relleno
fin=i+paddig_size;%finaliza en i mas el relleno 
signal=data_vec_pad(inicio:fin);%defino el nuevo vector
   pot_actual=pot(signal,inicio,fin);%calculo la potencia 
   signal_power(inicio)=pot_actual;
end
end

