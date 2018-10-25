function [ Ygt, Y ] = removeInvalidLabels( Ygt, Y )
%REMOVEINVALIDLABELS this function removes invalid labels from ground truth
%data and obtained labels

mask = isinf(Y) | isnan(Y);
Y(mask) = [];
Ygt(mask) = [];

fprintf('labels removed %s\n', num2str( sum(mask) ) );

end

