clear;
a=5;c=1;m=16;x0=1;
intx = zeros(1,m-1);
intx(1,1) = x0;
realx = zeros(1,1500);
realx(1,1) = x0 / m;
for i = 2:m-1
    intx(1,i) = mod(intx(1,i-1)*a+c,m);
    realx(1,i) = intx(1,i) / m;
end
for i = 16:1500
    realx(1,i)=realx(1,i-15)-realx(1,i-7);
    if realx(1,i)<0
        realx(1,i) = realx(1,i)+1;
    end
end
x = realx(1:2:end);
y = realx(2:2:end);
scatter(x,y,10,'filled');