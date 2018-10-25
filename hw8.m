clear

%% data initialization
T=[0.08 0.17 0.25 0.33 0.42 0.5 1 2 3];
K=[15.7 16.49 17.27 18.06 18.84 19.63 20.41 21.2 21.98 22.77 23.55 24.34 25.12];
data = [32.2 29.3 29.1 29.5 29.7 29.8 29.9 30.6 30.62;
    32 29.1 28.9 29.3 29.4 29.4 29.6 30.6 30.63;
    33.6 29.3 29 29.3 29.3 29.3 29.3 30.6 30.59;
    35 29.7 29.4 29.5 29.4 29.3 29.3 30.5 30.46;
    35 30.7 30.2 29.9 29.7 29.5 29.2 30.3 30.34;
    35 31 30.5 30.2 29.9 29.7 29.1 30.2 30.22;
    35 31 30.7 30.6 30.4 30 29.1 29.9 29.89;
    35 31 30.9 31.2 31 30.4 29.1 29.4 29.38;
    35 31 31 31.4 31.3 30.7 29.2 28.9 28.88;
    35 31 31 31.4 31.4 30.8 29.4 28.9 28.90;
    35 31 31 31.4 31.5 31.1 29.6 28.9 28.94;
    35.2 31 31 31.4 31.5 31.2 29.8 29 28.98;
    35.2 31 31 31.4 31.5 31.2 29.9 29 29.01];
data = data/100;
S=15.7;r=0.02;D=0.01;

%% df/dT
dfT = zeros(size(K,2),size(T,2)-1);
for i = 1:size(dfT,2)
    dfT(:,i) = (data(:,i+1)-data(:,i))/(T(1,i+1)-T(1,i));
end

%% df/dK and d^2f/dK^2
dfK = zeros(size(K,2)-1,size(T,2));
dfK2 = zeros(size(K,2)-2,size(T,2));
%dfK(1,:) = (data(2,:)-data(1,:))/(K(1,2)-K(1,1));
for i = 1:size(dfK,1)-1
    dfK(i,:) = (data(i+1,:)-data(i,:))/(K(1,i+1)-K(1,i));
    dfK2(i,:)= (data(i+2,:)+data(i,:)-2*data(i+1,:)) / (K(1,i+2)-K(1,i))^2;
end
i = i+1;
dfK(i,:) = (data(i+1,:)-data(i,:))/(K(1,i+1)-K(1,i));

%% resize
dfT = dfT(3:size(dfT,1),:);
dfK = dfK(2:size(dfK,1),2:size(dfK,2));
dfK2 = dfK2(:,2:size(dfK2,2));
data = data(3:size(data,1),2:size(data,2));
T = repmat(T(1,2:size(T,2)),11,1);
K = repmat(K(1,3:size(K,2)),8,1)';

%% calculate
numerator = data.^2+2.*data.*T.*(dfT+(r-D).*K.*dfK);
d = (log(S./K)+(r+data.^2/2).*T)./(data.*sqrt(T));
denominator = (1+K.*d.*dfK.*sqrt(T)).^2+data.*K.^2.*T.*(dfK2-d.*dfK.^2.*sqrt(T));
sigma = sqrt(numerator./denominator);
surf(K,T,sigma);
xlabel('strike');
ylabel('maturity');
zlabel('local volatility');

