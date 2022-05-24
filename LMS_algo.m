%% Program of LMS Algorithm
clc;
clear;
close all;

% Generating desired normal ECG Signal
[t, ecg] = ECG(6);

% Generating Signal corrupted with noise
n = numel(ecg);    % Number of array elements
noise = 0.1*randn(1,n);   % Noise signal
A = ecg(1:n) + noise;    % Normal ECG + Noise signal

%% LMS Algorithm starts
% 1 - Set start values for filter coefficients
% 2 - Calculate the error
% 3 - Update the filter coefficients
% 4 - Repeat steps 2 and 3 

M = 2;
wi = zeros(1,M);
E = [];
mu = 0.05;   % Convergence factor of LMS algorithm
for i = M:n
    j = A(i:-1:i-M+1);
    E(i) = ecg(i) - ((wi)*(j)');   % " ' " for complex conjugate
    wi = wi + 2*mu*E(i)*j;
end

% Estimation of the signal i.e. y(n)
Est = zeros(n,1);
for i = M:n
    j = A(i:-1:i-M+1);
    Est(i) = ((wi)*(j)');
end

% Computing the error signal:  e(n) = y(n) - d(n)
Err = Est' - ecg;

%% Display of Results
figure(1);
subplot(2, 1, 1);
plot(ecg);
title('Normal ECG signal');
xlabel('Time'); 
ylabel('ECG (mV)'); 

subplot(2, 1, 2);
plot(A);
plot(A);
title('Actual contaminated signal with noise');
xlabel('Time'); 
ylabel('ECG (mV)'); 

figure(2);
subplot(2, 1, 1);
plot(Err);
title('Error signal');
xlabel('Time'); 
ylabel('ECG (mV)');

subplot(2, 1, 2); 
plot(Est);
title('Estimation signal');
xlabel('Time'); 
ylabel('ECG (mV)');