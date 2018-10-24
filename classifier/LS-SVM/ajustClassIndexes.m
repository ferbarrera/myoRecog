function [ Xnew, Ynew, lastClassLabel ] = ajustClassIndexes( Xc, Yc, prevClasslabel, balanceRepose )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% remove respose features (last ones)
if balanceRepose
    mask = Yc == Yc( end );
    Yc( mask, : ) = [];
    Xc( mask, : ) = [];
end

% adjust labels
Ynew = Yc + prevClasslabel;

Xnew = Xc;

lastClassLabel = Ynew( end );

end

