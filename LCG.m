function [P,m,v] = LCG(a,c,m,x0)
    intx = zeros(1,m-1);
    intx(1,1) = x0;
    realx = zeros(1,m-1);
    realx(1,1) = x0 / m;
    for i = 2:m-1
        x = mod(intx(1,i-1)*a+c,m);
        if x == x0
            break;
        end
        intx(1,i) = x;
        realx(1,i) = x/m;
    end
    lasti = find(intx, 1, 'last');
    intx = intx(1:lasti);
    realx = realx(1:lasti);
    P = size(intx,2);
    m = mean(realx);
    if(lasti>=3)
        v = var(realx+realx(1,1)+realx(1,2)+realx(1,3));
    elseif(lasti == 2)
        v = var(realx+realx(1,1)+realx(1,2)+realx(1,1));
    else
        v = 0;
    end
end
        