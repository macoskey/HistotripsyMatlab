
function addwaitbar(n,maxamount)
% Adds a waitbar to anything you are doing
% J. Macoskey 2016
1
h = waitbar(0,'processing...');
while n < maxamount
    waitbar(n/maxamount)
    pause(0.1)
end
close(h)
end