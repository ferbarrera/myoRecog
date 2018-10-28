function [ subjetPath, modelPath ] = getModelPath( modelPath, database_id, dataset_id, subject_id )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

%fprintf('Checking ... %s\n', featuresPath);

global DATABASE_NAMES

modelPath = strcat( modelPath, filesep, DATABASE_NAMES{database_id});
modelPath =  strcat(modelPath, filesep, 'DB', num2str(dataset_id));
modelPath = strcat(modelPath, filesep, 's', num2str(subject_id));
subjetPath = modelPath;
modelPath = strcat(modelPath, filesep, 'models');

end

