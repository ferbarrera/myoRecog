function [ feature ] = integratedEmg( emg )
%IEMG Sthis function computes integrated EMG descriptor

feature = sum( abs(emg) );

end

