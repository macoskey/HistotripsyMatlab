%% PCA EXAMPLE
% J. Macoskey - 11.28.17

% Generate random 256-dimensional dataset
X = rand(128).*0.001;

% Make two of the dimensions the two principle components
X(1,:) = X(1,:).*10000;
X(2,:) = X(2,:).*1000;

% Calculate covarince matrix and take eigenvalue decomposition
C = (1/5).*X*X';
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
set(gca,'yscale','log')
xlabel 'k'
ylabel 'loss'
set(gca,'FontSize',16)
grid on