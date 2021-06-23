function [posteriors] = RWR_filtering(W,cost,X,Y,nei,c,sigma_c)

N = X*Y; % image size

% Build graph with symmetric weight matrix W
costVals = reshape(cost,N,1); clear cost;
 
% Random Walks with Restart (RWR)
E = sparse(1:N,1:N,ones(N,1)); iD  = sparse(1:N,1:N,1./sum(W));
P0 = double(costVals);

W_ = iD*W;  clear W iD;
R = c*(E-(1-c)*W_); clear P E;

Ps = R \ P0;
clear P0 R; 

% Estimate likelihoods

% likelihoods = Ps;
likelihoods = Ps/N;

posteriors = reshape(likelihoods,X,Y,1);


