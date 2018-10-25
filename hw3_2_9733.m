deltat = 0.01;
path = 10000;                            % This can be change to 100,1000,10000
W = zeros(path,101);
W(:,1) = 0;
s = zeros(path,1);
c = zeros(path,1);
for i = 1: path
    for j = 1:100
        W(i,j+1) = W(i,j)+sqrt(deltat)*norminv(rand,0,1);
    end
    s(i,1) = 90*exp(0.2*W(i,101));
    c(i,1)= max(s(i,1)-100,0);
end
pstock = mean(s);
poption = mean(c);

