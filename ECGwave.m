clc;
clear;
close all;

%% Generating desired normal ECG Signal

[t, ecg] = ECG(6);
subplot(2, 1, 1);
plot(ecg);
title('Normal ECG signal');
xlabel('Time'); 
ylabel('ECG (mV)'); 

%% Generating ECG signal corrupted with noise

n = numel(ecg);    % Number of array elements
noise = 0.1*randn(1,n);   % Noise signal
A = ecg(1:n) + noise;    % Normal ECG + Noise signal
subplot(2, 1, 2);
plot(A);
title('Actual contaminated signal with noise');
xlabel('Time'); 
ylabel('ECG (mV)'); 