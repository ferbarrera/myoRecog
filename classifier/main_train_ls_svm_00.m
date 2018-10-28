%% load project configuration
close all;
global COMPUTED_FEATURES_PATH 
global COMPUTED_MODELS_PATH


%% Script arguments

database_id = 1;
dataset_id = 1;
subject_id = 1;
exercise_id = 1;
featureFncName = {'avgDicreteSignalPower'};
svnKernel = 'RBF_kernel';
experimentId = 'prueba_uan';
numExperiments = 5;
featuresPath = COMPUTED_FEATURES_PATH{database_id};
modelPath = COMPUTED_MODELS_PATH{database_id};


%% Function call

% create directory
[ subjetPath, modelPath ] = createModelDirStruct( modelPath, database_id, dataset_id, subject_id );


[ XX, YY ] = getMultiFeaturesTrainingData( featuresPath, featureFncName, database_id, dataset_id, subject_id, exercise_id );

for expRep = 1:numExperiments

    
    X = XX;
    Y = YY;
    
    [ model, cp, confusionMatrix, confusionMatrixOrder] = trainclassifier( X, Y, svnKernel );
    
    save( strcat(modelPath, filesep, experimentId, '_', num2str(expRep) ), 'database_id', 'dataset_id', 'subject_id', 'exercise_id', 'featureFncName', 'svnKernel', ...
          'featuresPath', 'modelPath', 'cp', 'confusionMatrix', 'confusionMatrixOrder', 'model');

end
