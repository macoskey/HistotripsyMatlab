%lengthvec = input('enter vector length ');
lengthvec = 10;
vector = zeros(1,lengthvec);
p = 1:lengthvec-1;
vector(2:lengthvec) = p;
mixer = randperm(lengthvec);
randvec = zeros(1,length(vector));
for n = 1:length(vector)
    randvec(1,n) = vector(mixer(n));
end