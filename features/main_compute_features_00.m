%% load project configuration
close all;
global COMPUTED_FEATURES_PATH 


%% Script arguments

database_id = 1;
dataset_id = 1;
subject_id =1;
exercise_id = 1:3;
featureFncName = {'avgDicreteSignalPower'};
resultsPath = COMPUTED_FEATURES_PATH{1};

%% Function call

numFeatures = numel( featureFncName );
numExercises = numel( exercise_id );

featureFilePaths = cell( numFeatures*numExercises, 1);

i = 1;
for f = 1:numel( featureFncName )
    for e = 1:numel( exercise_id )
        [ featureRootPath, featureFilePaths{ i } ] = computeFeature( database_id, dataset_id, subject_id, exercise_id( e ), featureFncName{ f }, resultsPath );
        i = i + 1;
    end
end

save( strcat( featureRootPath, filesep, 'index.mat' ), 'featureFilePaths' );