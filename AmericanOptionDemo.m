
K     = 100;
T     = 1;
r     = 0.01;
delta = 0;
sigma = 0.2;
type  = 'put';
m = 1000;
n = 1000;
[S,t,V] = AmericanOption(K,T,r,delta,sigma,type,m,n);
Sf = FreeBoundary(S,t,V,K,type);
FreeBoundaryIndices = [1, find(abs(diff(Sf))>1e-5)+1];
plot(t(FreeBoundaryIndices),Sf(FreeBoundaryIndices),'LineWidth',1.5);
title('Exercise Boundary for Put Option');
xlabel('Time (years)');
ylabel('Stock price');
