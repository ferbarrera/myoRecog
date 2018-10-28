function [ Ygt, Y ] = removeInvalidLabels( Ygt, Y )
%REMOVEINVALIDLABELS this function removes invalid labels from ground truth
%data and obtained labels

newLabel = max( Ygt ) + 1;

mask = isinf(Y) | isnan(Y);
Y(mask) = newLabel;

fprintf('labels removed %s\n', num2str( sum(mask) ) );

end

