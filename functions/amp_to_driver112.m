function [pn,pp,pk] = amp_to_driver112(amp_voltage)
% Converts amplifier voltage to single-channel driver voltage for the
% 500-kHz 112 element array based on the calibration on 20180309
% 
% Jonathan Macoskey
% Created: 3.9.18
%
% Input:
%   amp_voltage = voltage level (in V) used on amplifier
% Outputs:
%   pn      = peak-negative voltage
%   pp      = peak-positive voltage
%   pk      = peak-to-peak voltage

load('driver_calib_500kHz_112c.mat')
direct = find(amp_voltage == driver_calib_500kHz_112c(:,1));
if direct
    pn = driver_calib_500kHz_112c(direct,2);
    pp = driver_calib_500kHz_112c(direct,3);
    pk = driver_calib_500kHz_112c(direct,4);
else
    begin = 6; % keeps out nonlinear part - should change this in future
    x = driver_calib_500kHz_112c(begin:end,1);
    X = [ones(length(x),1) x];
    b1 = X\driver_calib_500kHz_112c(begin:end,2);
    b2 = X\driver_calib_500kHz_112c(begin:end,3);
    b3 = X\driver_calib_500kHz_112c(begin:end,4);
    
    pn = b1(2)*amp_voltage + b1(1);
    pp = b2(2)*amp_voltage + b2(1);
    pk = b3(2)*amp_voltage + b3(1);
    fprintf('p- = %.2f\n',pn)
    fprintf('p+ = %.2f\n',pp)
    fprintf('pk = %.2f\n',pk)
end
end