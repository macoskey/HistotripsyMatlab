% Quantize any given analog signal into N bins
% J. Macoskey, 2019

function qsig = quantize(signal, N)
  xMin = min(signal);
  xMax = max(signal);
  interval = (xMax - xMin)/N;
  qsig = floor(signal./interval).*interval;
end