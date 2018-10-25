function [ feature ] = meanAbsoluteValueType2( emg )
%meanAbsoluteValueType1 this function computes mean Absolute Value Type 1 descriptor

segmentLength = numel(emg);
cut1 = round(0.25*segmentLength);
cut2 = round(0.75*segmentLength);

w = ones( numel(emg),1 );
w(1:cut1) = (4/segmentLength)*[1:cut1];
w(cut2:end) = (4/segmentLength)*([cut2:segmentLength] - segmentLength);

feature = ( 1/numel(emg) ) * sum( w.*abs(emg) );

end

