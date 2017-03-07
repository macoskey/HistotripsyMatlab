%%% This code shows how we can extract one left singular vector at a time
%%% using an optimization procedure
clear all, close all
n = 1000; m = 4; %% try different ones to get more out
A = randn(m,n);

    
% Create the problem structure.
    
% Define the problem cost function and its gradient.
% Compute the centered matrix from A
Atil = A-mean(A,2)*ones(1,size(A,2));
[u,s,v] = svd(Atil);

P = eye(m); U = [];

for idx = 1 : m,
        
    %% manopt minimizes a cost function -- hence negative
    problem.cost  = @(x) - (sum((A'*P*x).^2));
    problem.cost  = @(x) - var(x'*P*A,[],2); %% both are equivalent
    
    %% find direction on sphere  that minimizes cost function
    manifold = spherefactory(m); %% spherical constraint
    problem.M = manifold;

    [x, xcost, info] = neldermead(problem); 

    U = [U x];
    P = eye(m)-U*pinv(U);
end

imagesc(U'*u), colorbar
title('Compare U from manopt to u from SVD')
