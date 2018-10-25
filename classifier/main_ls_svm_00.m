%% load project configuration
close all;
global COMPUTED_FEATURES_PATH 
global COMPUTED_MODELS_PATH


%% Script arguments

database_id = 1;
dataset_id = 1;
subject_id = 1;
exercise_id = 1:3;
featureFncName = {'avgDicreteSignalPower'};
svnKernel = 'RBF_kernel';
featuresPath = COMPUTED_FEATURES_PATH{1};
modelPath = COMPUTED_MODELS_PATH{1};
experimentId = 'prueba';

%% Function call

% create directory
[ subjetPath, modelPath ] = createModelDirStruct( modelPath, database_id, dataset_id, subject_id );


[ XX, YY ] = getMultiFeaturesTrainingData( featuresPath, featureFncName, database_id, dataset_id, subject_id, exercise_id );

for expRep = 1:20

    X = XX;
    Y = YY;
    
    % init model
    model = initlssvm( X, Y, 'c', [], [], svnKernel);

    % tuning parameters 
    % -----------------
    % optimization algorithms: simplex, gridsearch, linesearch 
    % costfun: crossvalidatelssvm, leaveoneoutlssvm, rcrossvalidatelssvm and gcrossvalidatelssvm
    %          crossvalidatelssvm: dataset is divided into L disjoint sets
    %
    model = tunelssvm( model, 'simplex', 'crossvalidatelssvm', {10,'misclass'}, 'code_OneVsAll' );

    % train
    model = trainlssvm( model );

    % plot
    % plotlssvm( model );

    % simulate network
    Ysim = simlssvm(model, X);

    % remove misclasiffied
    [ Y, Ysim ] = removeInvalidLabels( Y, Ysim );

    % performance
    cp = classperf( Y,Ysim );
    [confusionMatrix, confusionMatrixOrder] = confusionmat(Y, Ysim);
    
    save( strcat(modelPath, filesep, experimentId, '_', num2str(expRep) ), 'database_id', 'dataset_id', 'subject_id', 'exercise_id', 'featureFncName', 'svnKernel', ...
          'featuresPath', 'modelPath', 'cp', 'confusionMatrix', 'confusionMatrixOrder');

end
