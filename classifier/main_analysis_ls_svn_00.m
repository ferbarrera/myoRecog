%% load project configuration
close all;
global COMPUTED_MODELS_PATH

%% Script arguments

experimentId = 'prueba_uan';
database_id = 1;
dataset_id = 1;
subject_id = 1;      % 1:numSubjects
exercise_id = 1;
numExperiments = 5;
modelPath = COMPUTED_MODELS_PATH{database_id};


%% Function call

% create directory structure for results
[ subjetPath, computedModelToPath ] = getModelPath( modelPath, database_id, dataset_id, subject_id );

error = zeros(numExperiments, 1);

for expRep = 1:numExperiments
    model = load( strcat(computedModelToPath, filesep, experimentId, '_', num2str(expRep) ) );
    error(expRep) = model.cp.ErrorRate;
end

dev = std( error );
avg = mean( error );


fprintf(' error %2.4f +/- %2.4f\n', avg, dev);