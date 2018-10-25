clear all;
clc;
S = 100;  K = 60:140;  T = 1.; rd = 0.05;  rf = 0.0;  CP = 1;
v0 = 0.49;  sigmaV = 0.3; rho = -0.5; kappa = 1.5;    theta = 0.1; 
r = rd-rf;

% FFT parameters 
eta = 0.25;
N = 4096; 

param = [v0, kappa, theta, sigmaV, rho];   
Call_FFT_Heston = genFFT(S, K, T, rd,rf, eta, N, 'Heston', param);

figure('name', 'Heston model');
plot(S./K, Call_FFT_Heston,'linewidth',2);
axis tight;
grid on
title 'Call Price in Heston vs M = S/K'
xlabel 'M'
ylabel 'C'

l1 = legend('FFT Heston');
set(l1,'Location','best')

%FFT BS and Analytical BS 
figure(2);
hold on
axis tight;
grid on
title 'FFT BS compared with analytical results'
xlabel 'M'
ylabel 'C'
Call_FFT_BS = genFFT(S, K, T, rd,rf, eta, N, 'BS', sigmaV);
plot(S./K, Call_FFT_BS,'linewidth',2);
analytical_BS = blsprice(S,K,rd-rf,T,sigmaV);
plot(S./K, analytical_BS,'linewidth',2);
plot(S./K, Call_FFT_BS - analytical_BS,'linewidth',2);
l2 = legend('FFT BS','Analytical BS','difference');
set(l2,'Location','best');
hold off

