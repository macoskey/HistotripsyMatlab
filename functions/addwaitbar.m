
function addwaitbar(maxamount)

h = waitbar(0,'waiting...');
for n = 1:maxamount
    waitbar(n/maxamount)
    pause(0.1)
end
close(h)
end