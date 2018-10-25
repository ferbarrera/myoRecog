function [ X, Y ] = getMultiFeaturesTrainingData( featuresPath, featureFncName, database_id, dataset_id, subject_id, exercise_id )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


numExercise = numel( exercise_id );
numfeatureFncs = numel( featureFncName );

Xc = cell( numExercise*numfeatureFncs, 1 );
Yc = cell( numExercise*numfeatureFncs, 1 );
i = 1;
prevClassLabel = 0;

for f = 1:numel( featureFncName )
    for e = 1:numel( exercise_id )
        [ Xtemp, Ytemp, currLastClassLabel ] = getTrainingData( featuresPath, featureFncName{ f }, database_id, dataset_id, subject_id, exercise_id( e ) );
        
        if i > 1
            [ Xc{ i }, Yc{ i }, currLastClassLabel]= ajustClassIndexes( Xtemp, Ytemp, prevClassLabel, 1 );
        else
            Yc{ i } = Ytemp;
            Xc{ i } = Xtemp;
        end
        
        prevClassLabel = currLastClassLabel;
        i = i + 1;
    end
end

X = cell2mat( Xc );
Y = cell2mat( Yc );

end

