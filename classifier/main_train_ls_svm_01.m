%% load project configuration
close all;
global COMPUTED_FEATURES_PATH 
global COMPUTED_MODELS_PATH


%% Script arguments

experimentId = 'prueba_uan';
database_id = 1;
dataset_id = 1;
subject_id = 1;      % 1:numSubjects
exercise_id = 1;
featureFncName = {'avgDicreteSignalPower'};
svnKernel = 'RBF_kernel';
numExperiments = 5;
featuresPath = COMPUTED_FEATURES_PATH{database_id};
modelPath = COMPUTED_MODELS_PATH{database_id};


%% Function call
for s = subject_id
    
    % create directory structure for results
    [ subjetPath, saveModelToPath ] = createModelDirStruct( modelPath, database_id, dataset_id, s );

    % get trainning data
    [ XX, YY ] = getMultiFeaturesTrainingData( featuresPath, featureFncName, database_id, dataset_id, s, exercise_id );

    for expRep = 1:numExperiments
    
        X = XX;
        Y = YY;
        
        [model, cp, confusionMatrix, confusionMatrixOrder] = trainclassifier( X, Y, svnKernel );
    
        save( strcat(saveModelToPath, filesep, experimentId, '_', num2str(expRep) ), 'database_id', 'dataset_id', 's', ...
            'exercise_id', 'featureFncName', 'svnKernel', 'featuresPath', 'modelPath', ...
            'cp', 'confusionMatrix', 'confusionMatrixOrder', 'model', 'expRep');
        
    end
    
end
