function [ X, Y ] = getMultiFeaturesTrainingData( featuresPath, featureFncName, database_id, dataset_id, subject_id, exercise_id )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


numExercise = numel( exercise_id );
numfeatureFncs = numel( featureFncName );

Xc = cell( numExercise, numfeatureFncs );
Yc = cell( numExercise );
%i = 1;
prevClassLabel = 0;

for e = 1:numel( exercise_id )
    for f = 1:numel( featureFncName )
        [ Xtemp, Ytemp, currLastClassLabel ] = getTrainingData( featuresPath, featureFncName{ f }, ...
            database_id, dataset_id, subject_id, exercise_id( e ) );
    
        if e>1
            [ Xc{ e,f }, Yc{ e }, currLastClassLabel]= ajustClassIndexes( Xtemp, Ytemp, prevClassLabel, 1 );
        else
            Xc{ e,f } = Xtemp;
            Yc{ e } = Ytemp;
        end
    end
    
    prevClassLabel = currLastClassLabel;
    
end

X = cell2mat( Xc );
Y = cell2mat( Yc );

end

