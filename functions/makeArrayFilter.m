function filt = makeArrayFilter(inputFilter,n)
% Makes array filter for filtering 2D matrix of 1D signals
% J. Macoskey - 10/13/17

% n = number of rows to add

tmp = inputFilter(:);
filt = tmp(:,ones(n,1));
    

end