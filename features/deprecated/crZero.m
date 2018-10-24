function [ cruces  ] = crZero( vec )
%Cuenta los ceros
cruces=0; % contador
for i=(1:(length(vec)-1));
     if vec(i)>0 && vec(i+1)<0
    cruces=cruces+1;
      end
      
    if vec(i)<0 && vec(i+1)>0
    cruces=cruces+1;
      end
end

