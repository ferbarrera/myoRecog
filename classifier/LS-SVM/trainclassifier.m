function [ model, cp, confusionMatrix, confusionMatrixOrder] = trainclassifier( X, Y, svnKernel )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

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


end

