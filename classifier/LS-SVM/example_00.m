X = 2.*rand(100,2)-1;
Y = sign(sin(X(:,1))+X(:,2));

gam = 10;
sig2 = 0.4;
type = 'classification';

% to train
[alpha,b] = trainlssvm({X,Y,type,gam,sig2,'RBF_kernel'});

% preprocessed off
%[alpha,b] = trainlssvm({X,Y,type,gam,sig2,'RBF_kernel','original'});

% preprocessed on
%[alpha,b] = trainlssvm({X,Y,type,gam,sig2,'RBF_kernel','preprocess'});
 
% to evaluate 
Xt = 2.*rand(10,2)-1;
Ytest = simlssvm({X,Y,type,gam,sig2,'RBF_kernel'},{alpha,b},Xt);
 
% plot results
plotlssvm({X,Y,type,gam,sig2,'RBF_kernel'},{alpha,b});

% roc
Y_latent = latentlssvm( {X,Y,type,gam,sig2,'RBF_kernel'}, {alpha,b}, X);
[area,se,thresholds,oneMinusSpec,Sens]=roc(Y_latent,Y);