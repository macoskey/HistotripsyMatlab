%% PCA EXAMPLE
% J. Macoskey - 11.28.17

% Generate Gaussian distributed zero-mean K-dimensional dataset
K = 128;
X = normrnd(0,1,K,K);

% Increase variance along two random dimensions
dims = randi([1 K],2,1);
X(dims(1),:) = X(dims(1),:).*1000;
X(dims(2),:) = X(dims(2),:).*250;

% Calculate covarince matrix and take eigenvalue decomposition
C = (1/K).*X*X';
[U,S] = eig(C);

% Construct optimal P with first two eigenvectors of C
Uk = U(1:2,:);
P = Uk'*Uk;

% Check data loss with 2-dimensional approximation of dataset
err = norm(P*X-X,'fro').^2;

% Calculate k-dimensional representation of X
Y = Uk*X;
figure(1), clf
plot(Y(1,:),Y(2,:),'o')
xlabel 'Principle Component 1'
ylabel 'Principle Component 2'
set(gca,'FontSize',16)
grid on

% Iterate through k-dimensional representations to see information loss
figure(2), clf
for k = 1:length(X)
    Uk = U(1:k,:);
    P = Uk'*Uk;
    err = norm(P*X-X,'fro').^2;
    plot(k,err,'b.'), hold on
end
% set(gca,'yscale','log')
xlabel 'k'
ylabel 'loss'
set(gca,'FontSize',16)
grid on