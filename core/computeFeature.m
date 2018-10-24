function [ rootOutputPath, outputDataPath ] = computeFeature( database_id, dataset_id, subject_id, exercise_id, featureFncName, resultsPath )
%COMPUTEFEATURE This function compute a feature from EMG signals

% load data

% read a subject's data
s1 = loadSubjectData( database_id, dataset_id, subject_id, exercise_id );

% read emg
emg_raw = getSEMG( s1 );

% pre-processing
lpf_coef = getLPFcoef( database_id, dataset_id );
[ emg ] = applyFilter( lpf_coef, emg_raw );
% plotSEMGsignals( emg, emg_filtered );

% read stimulus vector
stimulus = getStimulus( s1 );

% read repetition vector
repetition = getRepetition( s1,2 );


%% Compute feature

numElectrodes = size(emg, 2);
numStimulus = max( max(stimulus) ); % 0 reposo, 1 .. etc
numRepetitions = max( max (repetition) );

featureFncHandle = str2func( featureFncName );
features = cell( numStimulus+1, numRepetitions, numElectrodes );
class = zeros(numStimulus,1);

% compute feature for each stimul
for e = 1:numElectrodes
    for s = 1:numStimulus
        for r = 1:numRepetitions
            [ segment ] = extractEMGsegment( emg, stimulus, repetition, e, s, r ); 
            featureVec = featureFncHandle( segment ); 
            
            features{s, r, e} = featureVec; %s+1 because the last entry is repose
        end
        
        class(s) = s;
    end
end

% compute feature for repose
for e = 1:numElectrodes
    [ segment ] = extractEMGsegment( emg, stimulus, repetition, e, 0, 0 ); 
    featureVec = featureFncHandle( segment );
    
    for r = 1:numRepetitions        
        features{numStimulus+1, r, e} = featureVec; %s+1 is the repose
    end
    
    class(numStimulus+1) = numStimulus+1;
end


% Saving features
[rootOutputPath, curFeaturePath ] = createFeaturesDirStruct( resultsPath, database_id, dataset_id, subject_id, exercise_id );
outputDataPath = strcat( curFeaturePath, filesep ,featureFncName, '_E', num2str( exercise_id ), '.mat' );
save( outputDataPath, 'features', 'featureFncName', 'class' );

end