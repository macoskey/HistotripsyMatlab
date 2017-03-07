function [x] = maxspheresubspace_fx(A,f,U)
    
m = size(A,1);
if(~exist('U','var'))
    U = zeros(m,0);
end
       
%% find direction on sphere  that minimizes cost function
manifold = spheresubspacefactory(m,U); %% spherical constraint
problem.M = manifold;
options.verbosity = 0;
options.maxiter = 2000; %% maximum number of iterations
    
  
problem.cost  = @(x) -f(x'*A); 

[x,~,~] = neldermead(problem,[],options); 
