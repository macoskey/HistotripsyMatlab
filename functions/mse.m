function error = mse(X,Xa)
% Returns the error of the estimate (X) based on the actual (Xa). Can be
% used for n-dimensional datasets. Calculated using Frobenius norm.
% 
% Jonathan Macoskey
% Created: 1.29.18
%
% Input:
%   X   = Your estimate of X
%   Xa  = The "actual" value of X

idx = and(~isnan(X),~isnan(Xa));
if sum(idx) ~= length(X(:))
    fprintf('NaNs in at least one input: displaying non-NaN index error\n')
error = norm(X(idx)-Xa(idx),'fro')/norm(X(idx),'fro');
end