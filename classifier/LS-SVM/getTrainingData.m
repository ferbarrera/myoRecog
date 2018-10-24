function [ X, Y, lastClasslabel ] = getTrainingData( featuresPath, featureFncName, database_id, dataset_id, subject_id, exercise_id )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


[ f1 ] = loadFeatures( featuresPath, featureFncName, database_id, dataset_id, subject_id, exercise_id );

numStimulus = size( f1.features, 1 ); % included repose, repose is the last 
numRepetitions = size( f1.features, 2 );
numElectrodes = size( f1.features, 3 );

raw_data = cell2mat( f1.features );
X = zeros( numStimulus*numRepetitions, numElectrodes );
Y = zeros( numStimulus*numRepetitions, 1 );
i = 0;

for s = 1:numStimulus
    for r = 1:numRepetitions
        i = i+1;
        X( i , :) = squeeze( raw_data( s, r, : ) )';
        Y( i ) = s;
    end
end

lastClasslabel = numStimulus;

end

