% Jinc, Tim Schulz

function f = jincv3(r)

mask = (r~=0);

f = (pi/4)*ones(size(r));

f(mask) = besselj(1,pi*r(mask))./(2*r(mask));

return;