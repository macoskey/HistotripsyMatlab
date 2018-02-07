 function xx = npls_sps(yy, niter, beta, delta)
%function xx = npls_sps(yy, niter, beta, delta)
% nonquadratic penalized least-squares de-noising of an image y
% using separable paraboloidal surrogates (SPS) algorithm
% yy	image to be "de-noised"
% niter	# of iterations
% beta	# roughness penalty parameter
% delta	# roughness penalty parameter

if nargin < 2, niter = 80; end
if nargin < 3, beta = 2^4; end % defaults appropriate for HW problem
if nargin < 4, delta = 0.5; end

[nx ny] = size(yy);
C = buildC(nx,ny); % create penalty matrix for 1st-order differences

% \omega "curvature" function for Lange3 penalty
wt = @(t) 1 ./ (1 + abs(t) / delta);
%wt = @(t) ones(size(t)); % for quadratic penalty

denom = 1 + beta * abs(C)' * (abs(C) * ones(nx*ny,1)); % SQS version
% denom = 1 + 8 * beta; % simple version based on matrix 1-norm of C'C

xx = yy(:); % initial guess, the noisy image - in a vector

for ii=1:niter
	Cx = C * xx;
	xx = xx - (xx - yy(:) + beta * (C' * (wt(Cx) .* Cx))) ./ denom;
end
xx = reshape(xx, size(yy)); % turn vector back into an image


%
% Build a sparse matrix that computes first-order differences
% between horizontal and vertical neighboring pixels.
%
function C = buildC(nx, ny)
i = 1:(nx-1); j = 1:(nx-1); % row and column indices
i = [i i]; j = [j j+1];
s = [ones(nx-1,1) -ones(nx-1,1)]; % 1 and -1 values
Cx = sparse(i, j, s); % matrix rows are [0 ... 0 1 -1 0 ... 0]

i = 1:(ny-1); j = 1:(ny-1);
i = [i i]; j = [j j+1];
s = [ones(ny-1,1) -ones(ny-1,1)];
Cy = sparse(i, j, s); % matrix rows are [0 ... 0 1 -1 0 ... 0]

% make it apply to each row of image (respectively each column)
% and combine horizontal and vertical penalties
C = [kron(speye(ny), Cx); kron(Cy, speye(nx))];
