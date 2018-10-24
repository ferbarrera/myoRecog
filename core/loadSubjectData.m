function [ subjectData ] = loadSubjectData( database_id, dataset_id, subject_id, exercise_id )
% LOADSUBJECTDATA read a subject data
%   [subjectData] = LOADSUBJECTDATA(database_id, subject_id, exercise_id)
%   read a subject data given a dataset_id, subject_id, and exercise_id
%
% Example:
%   out = loadSubjectData(1, 1, 1, 1); for ninapro database, DB1, S1, set
%   of exercises 1

global DATABASE_PATH 

if isempty('NINAPRO_DATABASE_PATH')
    error('Error. \n NINAPRO_DATABASE_PATH does no exist, run config.m','');
end

filepath = strcat(DATABASE_PATH{database_id}, 'DB', num2str(dataset_id), filesep, 's', num2str(subject_id));
filename = sprintf('S%d_A%d_E%d.mat', dataset_id, subject_id, exercise_id );

subjectData = load(strcat(filepath, filesep, filename));

end