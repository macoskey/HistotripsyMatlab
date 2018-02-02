function ind = ndMatrixMin(matrix)
% Finds the minimum location of an n-dimensional matrix. Currently only
% supports 2D... give me a bit to get this totally working.
% 
% Jonathan Macoskey
% Created: 2.2.18
%

    val = min(matrix(:));
    ind = zeros(length(size(matrix)),1); 
    [ind(1), ind(2)] = find(matrix == val);
end