function [ feature ] = meanAbsoluteValue( emg )
%IEMG Sthis function computes integrated EMG descriptor

feature = (1/numel(emg) ) * sum( abs(emg) );


end

