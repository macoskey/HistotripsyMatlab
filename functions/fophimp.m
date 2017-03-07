function [vc] = fophimp(t,v) 

dt = t(2)-t(1);
n = length(t);
f = 1/n/dt*[-n/2+0.5:n/2-0.5];
w = 2*pi*f;

a_ax = 55e-6;
P = 1.3;
k = 2*pi*f/1500;

struve = 2/pi - besselj(0, 2*k*a_ax) + (16/pi-5).*sin(2*k*a_ax)./(2*k*a_ax) + (12 - 36/pi)...
    .*(1-cos(2*k*a_ax))./(2*k*a_ax).^2;
H = 1 + P * (1 - besselj(1, 2*k*a_ax)./(k*a_ax) - j*struve./(k*a_ax));

V = fftshift(fft(v));

VC = -V./H;

vc = ifft(ifftshift(VC));

end