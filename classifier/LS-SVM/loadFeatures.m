function [ features ] = loadFeatures( featuresPath, featureFncName, database_id, dataset_id, subject_id, exercise_id )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
global DATABASE_NAMES

featuresPath = strcat(featuresPath, filesep, DATABASE_NAMES{database_id}, ...
    filesep, 'DB', num2str(dataset_id), filesep, 's', num2str(subject_id), ...
    filesep, 'e', num2str(exercise_id), filesep, featureFncName, '_e', num2str(exercise_id), '.mat' );

features = load( featuresPath );

fprintf('loading ... %s\n', featuresPath);

end

