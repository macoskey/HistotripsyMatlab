function Qpca = pca_basis(A)
%% Assume A is zero mean


kappa2 = @(y) mean(y.^2,2); %% fourth central cumulant

xpca = maxspheresubspace_fx(A,kappa2);
Xpca = xpca;
for idx = 2 : size(A,1)-1,
    xpca = maxspheresubspace_fx(A,kappa2,Xpca);
    Xpca = [Xpca xpca];
end
[Qpca,~] = qr(Xpca);

%% Alternately 
%% [Qpca,~,~] = svd(A,'econ');
