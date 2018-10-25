function [ feature ] = avgDicreteSignalPower( emg )
%DISCRETESIGNALPOWER This function computes the power of a signal

T = numel(emg);
feature = (1/T) * sum( emg.^2 );

end

