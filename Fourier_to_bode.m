clc;
clear;

% --- Input Section ---
disp('Bode Plot Generator');
disp('---------------------');
num = input('Enter the numerator coefficients [e.g., 1 3]: ');
den = input('Enter the denominator coefficients [e.g., 1 2 0]: ');

% --- Create Transfer Function ---
sys = tf(num, den);

% --- Calculate Margins ---
[GM, PM, w_gc, w_pc] = margin(sys);

% --- Display Margins in Command Window ---
fprintf('\nGain Margin  : %.2f dB at %.2f rad/s\n', 20*log10(GM), w_pc);
fprintf('Phase Margin : %.2f° at %.2f rad/s\n', PM, w_gc);

% --- Plot Bode with PM & GM ---
figure;
margin(sys);  % This automatically shows PM and GM lines
grid on;
title('Bode Plot with Gain and Phase Margins');
