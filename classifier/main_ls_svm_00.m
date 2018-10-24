%% load project configuration
close all;
global COMPUTED_FEATURES_PATH 


%% Script arguments

database_id = 1;
dataset_id = 1;
subject_id = 1;
exercise_id = 1:3;
featureFncName = {'avgDicreteSignalPower'};
featuresPath = COMPUTED_FEATURES_PATH{1};


%% Function call

numExercise = numel( exercise_id );
numfeatureFncs = numel( featureFncName );

Xc = cell( numExercise*numfeatureFncs, 1 );
Yc = cell( numExercise*numfeatureFncs, 1 );
i = 1;
prevClassLabel = 0;

for f = 1:numel( featureFncName )
    for e = 1:numel( exercise_id )
        [ Xtemp, Ytemp, currLastClasslabel ] = getTrainingData( featuresPath, featureFncName{ f }, database_id, dataset_id, subject_id, exercise_id( e ) );
        
        if i > 1
            [ Xc{ i }, Yc{ i }, currLastClasslabel]= ajustClassIndexes( Xtemp, Ytemp, prevClassLabel, 1 );
        else
            Yc{ i } = Ytemp;
            Xc{ i } = Xtemp;
        end
        
        prevClassLabel = currLastClasslabel;
        i = i + 1;
    end
end

X = cell2mat( Xc );
Y = cell2mat( Yc );

model = initlssvm( X, Y, 'c', [], [], 'RBF_kernel');
model = tunelssvm(model,'simplex','crossvalidatelssvm',{10,'misclass'},'code_OneVsAll');
%model = tunelssvm( model, 'simplex','leaveoneoutlssvm', {'misclass'}, 'code_OneVsAll');

% model = changelssvm(model, 'codetype', 'code_MOC');
% model = changelssvm(model, 'codedist_fct', 'codedist_hamming');
% model = codelssvm(model);

model = trainlssvm( model );
%plotlssvm( model );

Yt = simlssvm(model, X);

if ( (sum(isnan(Yt)) > 0) || (sum(isinf(Yt)) > 0))
    mask = isinf(Yt) | isnan(Yt);
    Yt(mask) = [];
    Y(mask) = [];
end

cp = classperf(Y,Yt);

[C,order] = confusionmat(Y, Yt);




