%illustrate periodic functions via modulo
f = @(x,s) (abs(x-s) <=1) .* (1-abs(x-s));
t = linspace(-7,7,141);
s = 5;
a = s-1;
tm = mod(t-a,3) + a;
clf, subplot(211), plot(t, f(t,s)), ylabel f(t), title 'Original Signal'
axis tight
subplot(212), plot(t, f(tm,s)), title('Periodic extension with \Delta=3')
xlabel t, ylabel 'f(4+mod(t-4, 3))', axis tight
