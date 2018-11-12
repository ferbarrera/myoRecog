%% load project configuration
close all;
global COMPUTED_FEATURES_PATH 
global COMPUTED_MODELS_PATH


%% Script arguments

experimentId = 'prueba_uan';
database_id = 1;     % 1 ninapro, 2 uan    
dataset_id = 3;
subject_id = 1:1;    % 1:numSubjects
exercise_id = 2;     % 1, 2, 3, 1:3
featureFncName = {'integratedEmg'}; % {'avgDicreteSignalPower' 'integratedEmg'};
svnKernel = 'RBF_kernel';
numExperiments = 3;
featuresPath = COMPUTED_FEATURES_PATH{database_id};
modelPath = COMPUTED_MODELS_PATH{database_id};


%% Function call

% model accuracy
accuracyExperimentSubject = zeros(numExperiments, numel(subject_id));
accuracySubject = zeros(numExperiments, 2);
accuracyInterSubject = zeros( 1, 2);

for s = subject_id
    
    % create directory structure for results
    [ subjetPath, saveModelToPath ] = createModelDirStruct( modelPath, database_id, dataset_id, s );

    % get trainning data
    [ XX, YY ] = getMultiFeaturesTrainingData( featuresPath, featureFncName, database_id, dataset_id, s, exercise_id );

    for expRep = 1:numExperiments
    
        X = XX;
        Y = YY;
        
        [model, cp, confusionMatrix, confusionMatrixOrder] = trainclassifier( X, Y, svnKernel );
    
%         save( strcat(saveModelToPath, filesep, experimentId, '_', num2str(expRep) ), 'database_id', 'dataset_id', 's', ...
%             'exercise_id', 'featureFncName', 'svnKernel', 'featuresPath', 'modelPath', ...
%             'cp', 'confusionMatrix', 'confusionMatrixOrder', 'model', 'expRep');
        
        accuracyExperimentSubject( expRep,s ) = cp.ClassifiedRate;	% Classified Samples / Total Number of Samples;
    end
    
    accuracySubject( s,1 ) = mean( accuracyExperimentSubject( :,s ) );
    accuracySubject( s,2 ) = std( accuracyExperimentSubject( :,s ) );
    
end

accuracyInterSubject( 1,1 ) = mean( accuracyExperimentSubject(:) );
accuracyInterSubject( 1,2 ) = std( accuracyExperimentSubject(:) );


fprintf('********Accuracy report*************\n');
for s = subject_id
    fprintf('Subject = %d Accuracy %2.2f +/- %2.2f\n', s, accuracySubject( s,1 ), accuracySubject( s,2 ) );
end

fprintf('All Subjects Accuracy %2.2f +/- %2.2f\n', accuracyInterSubject( 1,1 ), accuracyInterSubject( 1,2 ) );
