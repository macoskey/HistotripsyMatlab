function f = ft2(in)
f = fftshift(fft2(fftshift(in)));