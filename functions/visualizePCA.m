function [u1] = visualizePCA(A)
[n,m] = size(A);
figure
plot(A(1,:),A(2,:),'redo'); 
hold on
[U,S,V] = svd(A-repmat(mean(A,2),1,m));
line([0 U(1,1)], [0 U(2,1)],'LineWidth',2); axis equal
u1 = U(:,1);