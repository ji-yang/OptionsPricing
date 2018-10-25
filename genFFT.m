function FFT = genFFT(S, K, T, rd,rf, eta, N, type, param)
    
    %initialize paprameters
    v = 0:eta:eta*(N-1);
    r = rd - rf;
    alpha = 1.5;
    
    %characteristic function and psi
    if strcmp(type, 'Heston')
        v0 = param(1,1);
        kappa = param(1,2);
        theta = param(1,3);
        sigmaV = param(1,4);
        rho = param(1,5);
        cf = hestoncf(log(S),v,T,r,alpha,v0,kappa,theta,sigmaV,rho);
    elseif strcmp(type, 'BS')
        cf = bscf(log(S),v,T,r,alpha,param);
    end
    psi = exp(-r*T).*cf./(alpha^2+alpha-v.^2+1i*(2*alpha+1).*v);
        
    %FFT
    lambda = 2*pi/N/eta;
    b = 0.5*N*lambda;
    k=-b:lambda:b-lambda;
    weighting = [1/3,4/3,repmat([2/3,4/3],1,N/2-1)];
    call = exp(-alpha.*k)/pi .* fft(exp(1i*b.*v).*psi.*weighting*eta,N);
    c = interp1(k,call,log(K),'spline');
    FFT = real(c);
end

