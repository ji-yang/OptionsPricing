% Problem 2 
% Part (i)
G = [];
count = 0;
mu = 0;
sigma = 0.1;
N = 10000;                         % generate 10000 normally distributed random variables
for i = 1:N
    G(i) = norminv(rand,mu,sigma);
    if G(i)>0.1
        count = count+1;
    end
end

P = count/N;                        % P[X>0.1]


% Part (ii)
X = sort(G);
count2 = zeros(1,100);              % let's have 100 intervals and calculate the width of each interval
pro = zeros(1,100);
delta = (X(N)-X(1))/100;
interval = X(1):delta:X(N);     % define the interval for easier counting

 for i = 1:100
    for j =1:N
        if X(j)>=interval(i) && X(j)<=interval(i+1)
            count2(i)=count2(i)+1;
            pro(i) = count2(i)./N;
        end
    end
end

E = 0;
for i = 1:100
    E = E+ ((interval(i)+delta).^4)*pro(i);
end




