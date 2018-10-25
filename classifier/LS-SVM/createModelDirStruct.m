function [ subjetPath, modelPath ] = createModelDirStruct( modelPath, database_id, dataset_id, subject_id )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

%fprintf('Checking ... %s\n', featuresPath);

global DATABASE_NAMES

if ~exist(modelPath, 'dir')
    mkdir(modelPath)
    fprintf('... creating %s\n', modelPath);
end

modelPath = strcat( modelPath, filesep, DATABASE_NAMES{database_id});
%fprintf('Checking ... %s\n', featuresPath);

if ~exist(modelPath, 'dir')
    mkdir(modelPath)
    fprintf('... creating %s\n', modelPath);
end

modelPath =  strcat(modelPath, filesep, 'DB', num2str(dataset_id));
%fprintf('Checking ... %s\n', featuresPath);

if ~exist(modelPath, 'dir')
    mkdir(modelPath)
    fprintf('... creating %s\n', modelPath);
end

modelPath = strcat(modelPath, filesep, 's', num2str(subject_id));
subjetPath = modelPath;
%fprintf('Checking ... %s\n', featuresPath);

if ~exist(modelPath, 'dir')
    mkdir(modelPath)
    fprintf('... creating %s\n', modelPath);
end


modelPath = strcat(modelPath, filesep, 'models');
%fprintf('Checking ... %s\n', featuresPath);

if ~exist(modelPath, 'dir')
    mkdir(modelPath)
    fprintf('... creating %s\n', modelPath);
end

end

