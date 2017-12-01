%% K-Means Example
% J. Macoskey - 11.28.17
%
% INCOMPLETE
%
%

%% form dataset
nclust = 5;
X = normrnd(0,4,2,nclust);
npts = 100;
ptsx = zeros(5,npts); ptsy = ptsx;
for n = 1:5
   ptsx(n,:) = normrnd(X(1,n),1,1,npts);
   ptsy(n,:) = normrnd(X(2,n),1,1,npts);
end
ptsx = ptsx(:);
ptsy = ptsy(:);

figure(1), clf
plot(ptsx,ptsy,'k.'), hold on
grid on
xlim([-10 10]), ylim([-10 10])

%% run kmeans

% Initialize random centroids
midx = randi([1 npts*nclust],5,1);
m = zeros(nclust,2);
m(:,1) = ptsx(midx);
m(:,2) = ptsy(midx);
plot(m(:,1),m(:,2),'*')