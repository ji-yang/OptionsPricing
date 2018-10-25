clear;
%version 1
time1 = zeros(1,5);
for i = 3:7
    tic;
    for j = 1:power(10,i)/2
        r1 = rand();
        r2 = rand();
        y1 = sqrt(-2*log(r1)) * cos(2*pi*r2);
        y2 = sqrt(-2*log(r1)) * sin(2*pi*r2);
    end
    time1(1,i-2)=toc;
end

%version 2
time2 = zeros(1,5);
for i = 3:7
    tic;
    for j = 1:power(10,i)/2
        x1 = 2*rand() -1;
        x2 = 2*rand() -1;
        w = x1*x1 + x2*x2;
        while (w >=1)
            x1 = 2*rand() - 1;
            x2 = 2*rand() - 1;
            w = x1*x1 + x2*x2;
        end
        w = sqrt( (-2.0 * log( w ) ) / w );
        y1 = x1 * w;
        y2 = x2 * w;
    end
    time2(1,i-2)=toc;
end
x = [3 4 5 6 7];
figure(1);
title('Time comparison of two forms of Box Muller');
xlabel('n with 10^n generations');
ylabel('Execution time (s)');
hold on;
plot(x,time1,'linewidth',2);
plot(x,time2,'linewidth',2);
legend('Basic form','Polar form','location','best');
hold off;
xticks([3 4 5 6 7]);
        
        