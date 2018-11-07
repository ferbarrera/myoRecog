%% load project configuration
% this code computes a set of features for a given list of subject

close all;
global COMPUTED_FEATURES_PATH 


%% Script arguments

database_id = 1;            % 1 ninapro, 2 uan_00
dataset_id = 3;
subject_id =1:2;           % subject index
exercise_id = 1:3;          % 1, 2 or 3
featureFncName = {'avgDicreteSignalPower' 'integratedEmg' 'meanAbsoluteValue' 'meanAbsoluteValueType1' 'meanAbsoluteValueType2'};
resultsPath = COMPUTED_FEATURES_PATH{1};

%% Function call

numFeatures = numel( featureFncName );
numExercises = numel( exercise_id );

featureFilePaths = cell( numFeatures*numExercises, 1);

i = 1;
for s = 1:numel(subject_id)
    for f = 1:numel( featureFncName )
        for e = 1:numel( exercise_id )
            fprintf('Computing features for subject = %d, exercise = %d, func = %s \n', subject_id( s ), exercise_id( e ),featureFncName{f})
            [ featureRootPath, featureFilePaths{ i } ] = computeFeature( database_id, dataset_id, subject_id( s ), exercise_id( e ), featureFncName{ f }, resultsPath );
            i = i + 1;
        end
    end
end
    
save( strcat( featureRootPath, filesep, 'index.mat' ), 'featureFilePaths' );