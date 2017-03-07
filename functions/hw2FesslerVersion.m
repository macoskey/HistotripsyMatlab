tx = 3;
ty = 4;
x = linspace(0,2*tx,101);
y = linspace(0,2*ty,103); % using different values is good for debugging!
[xx yy] = ndgrid(x,y);
rect = @(t) single(abs(t) < 1/2);
modf = @(x,T) mod(x+T/2, T) - T/2;
gg = 5 * rect(sqrt(modf(xx,tx).^2 + modf(yy,ty).^2) / 2);
clf, pl = @(i) subplot(231 + i);
pl(0), imagesc(x, y, gg'), axis image, colorbar
xlabel x, ylabel y, title ’g(x,y)’
xt = [0:1:2]*tx; yt = [0:1:2]*ty;
colormap gray
xtick(xt), ytick(yt)
ckl_fun = @(p) 20/tx/ty * jincSignal(2 * p); % renamed to jincSignal to prevent using wrong jinc
for ii=1:2
    nterm = 4 + (ii-1) * 10; % 4 and 14
    g = 0;
        for k=-nterm:nterm
            for l=-nterm:nterm
            ckl = ckl_fun(sqrt((k/tx)^2 + (l/ty)^2));
            g = g + ckl * cos(2*pi*(k * xx/tx + l * yy/ty));
            end
        end
    pl(ii), imagesc(x, y, g'), axis image, colorbar
    % xlabel x, ylabel y
    xtick(xt), ytick(yt)
    colormap gray
    title(sprintf('g_N(x,y) with N=%d', nterm))
    caxis([0 5]);
end
colormap gray
%ir_savefig fourier_series