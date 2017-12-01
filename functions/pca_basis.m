function Qpca = pca_basis(A)
% Generates PCA basis function
% Inpsired by EECS 551 - University of Michigan
% J. Macoskey
% 2016


kappa2 = @(y) mean(y.^2,2); %% fourth central cumulant

xpca = maxspheresubspace_fx(A,kappa2);
Xpca = xpca;
for idx = 2 : size(A,1)-1,
    xpca = maxspheresubspace_fx(A,kappa2,Xpca);
    Xpca = [Xpca xpca];
end
[Qpca,~] = qr(Xpca);

% Alternately 
% [Qpca,~,~] = svd(A,'econ');
