function addPathToLibraries()

fprintf('**************************\n');
fprintf('** myoRecog toolbox     **\n');
fprintf('**************************\n\n');

sprintf('\nLoading toolbox dependencies\n');

% local functions
addpath( './classifier/LS-SVM/' );
addpath( './classifier/' );
addpath( './core/' );
addpath( '../LSSVMlabv1_8_R2009b_R2011a/' );
addpath( './features/');
addpath( './features/time/');


% GLOBAL VARIABLES
global DATABASE_NAMES
global DATABASE_PATH 
global LS_SVM_PATH
global COMPUTED_FEATURES_PATH 
global COMPUTED_MODELS_PATH

%database names
DATABASE_NAMES{ 1 } = 'ninapro';
DATABASE_NAMES{ 2 } = 'uan_00';

% database list
DATABASE_PATH{ 1 } = '/Users/fernando/emg_database/ninapro/';
DATABASE_PATH{ 2 } = '/Users/fernando/emg_database/uan_00/';

% ls-svm libs
LS_SVM_PATH{ 1 } = '/Users/fernando/Documents/GitHub/LSSVMlabv1_8_R2009b_R2011a/';

% path to computed features
COMPUTED_FEATURES_PATH{ 1 } = '/Users/fernando/emg_database/results_ninapro/';

% path to computed models
COMPUTED_MODELS_PATH{ 1 } = '/Users/fernando/emg_database/results_ninapro/';


fprintf('\n\n');
fprintf('Loading global variables ...OK');
fprintf('\n\n');
end
