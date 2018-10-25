%% Q1
S=30:1:170;
K = 100;
T = 1;
sigma = 0.2;
r = 0.05;
d1 = (log(S/K) + (r+0.5*sigma^2)*T) / (sigma * sqrt(T));
d2 = d1 - sigma * sqrt(T);
C = S .* normcdf(d1) - K * exp(-r*T).* normcdf(d2);
figure(1);
plot(S,C);
xlabel('S');
ylabel('C');
xlim([30 170]);
%% Q2
P  = K * exp(-r*T).* normcdf(-d2) - S .* normcdf(-d1);
figure(2);
plot(S,P);
xlabel('S');
ylabel('P');
xlim([30 170]);
%% Q3
%T = 0.05;
sigma = 0.01;
d1 = (log(S/K) + (r+0.5*sigma^2)*T) / (sigma * sqrt(T));
d2 = d1 - sigma * sqrt(T);
c = S .* normcdf(d1) - K * exp(-r*T).* normcdf(d2);
figure(3);
plot(S,c);
xlabel('S');
ylabel('C');
xlim([30 170]);