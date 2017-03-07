function M = spheresubspacefactory(n,U)
% Returns a manifold struct to optimize over unit-norm vectors 
% that lie in the orthocomplement of the range of U.
%
% function M = spherefactory(n)
% function M = spherefactory(n,U)
%
% Manifold of n-by-1 real vectors of unit norm that are in
% the orthocomplement of the range of U.
% When the U argument is omitted then it is manifold of n-by-1 
% real vectors of unit norm.
% 

% Original author: Nicolas Boumal, Dec. 30, 2012.
% Contributors: Raj Rao
% Change log: 

    m = 1;
    if ~exist('U', 'var')
        P = eye(n);
    else
        % projection matrix onto orthocomplement of R(U)
        [Q,~]  = qr(U,0); 
        P = eye(n) - (Q*Q');
    end
    
    r = rank(P);
    
    M.dim = @() r-1;

    M.name = @() sprintf('Sphere S^%d', r-1);

    M.inner = @(x, d1, d2) d1(:).'*d2(:);
    
    M.norm = @(x, d) norm(d, 'fro');
    
    M.dist = @(x, y) real(acos(x(:).'*y(:)));
    
    M.typicaldist = @() pi;
    
    M.proj = @(x, d) d - P*x*((x(:)).'*d(:));
    
    M.tangent = M.proj;
	
    % For Riemannian submanifolds, converting a Euclidean gradient into a
    % Riemannian gradient amounts to an orthogonal projection.
	M.egrad2rgrad = M.proj;
	
	M.ehess2rhess = @ehess2rhess;
	function rhess = ehess2rhess(x, egrad, ehess, u)
        rhess = M.proj(x, ehess) - (x(:)'*egrad(:))*u;
        %rhess = M.proj(x, ehess - (x(:)'*egrad(:))*u );
	end
    
    M.exp = @exponential;
    
    M.retr = @retraction;

    M.log = @logarithm;
    function v = logarithm(x1, x2)
        v = M.proj(x1, x2 - x1);
        di = M.dist(x1, x2);
        % If the two points are "far apart", correct the norm.
        if di > 1e-6
            nv = norm(v, 'fro');
            v = v * (di / nv);
        end
    end
    
    M.hash = @(x) ['z' hashmd5(x(:))];
    
    M.rand = @() random(n, m,P);
    
    M.randvec = @(x) randomvec(n, m, x,P);
    
    M.lincomb = @matrixlincomb;
    
    M.zerovec = @(x) zeros(n, m);
    
    M.transp = @(x1, x2, d) M.proj(x2, d);
    
    M.pairmean = @pairmean;
    function y = pairmean(x1, x2)
        y = x1+x2;
        y = y / norm(y, 'fro');
    end

    M.vec = @(x, u_mat) u_mat(:);
    M.mat = @(x, u_vec) reshape(u_vec, [n, m]);
    M.vecmatareisometries = @() true;

end

% Exponential on the sphere
function y = exponential(x, d, t)

    if nargin == 2
        t = 1;
    end
    
    td = t*d;
    
    nrm_td = norm(td, 'fro');
    
    if nrm_td > 4.5e-8
        y = x*cos(nrm_td) + td*(sin(nrm_td)/nrm_td);
    else
        % If the step is too small to accurately evaluate sin(x)/x,
        % then sin(x)/x is almost indistinguishable from 1.
        y = x + td;
        y = y / norm(y, 'fro');
    end

end

% Retraction on the sphere
function y = retraction(x, d, t)

    if nargin == 2
        t = 1;
    end
    
    y = x + t*d;
    y = y / norm(y, 'fro');

end

% Uniform random sampling on the sphere.
function x = random(n, m,P)

    x = P*randn(n, m);
    x = x/norm(x, 'fro');

end

% Random normalized tangent vector at x.
function d = randomvec(n, m, x,P)

    d = randn(n, m);
    d = d - x*(x(:).'*d(:));
    d = P*d / norm(P*d, 'fro');

end
