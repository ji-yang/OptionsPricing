function cf = hestoncf(x0, u, T, r, alpha, v0, kappa, theta, sigma, rho)
    v = u - (alpha+1)*1i;
    zeta = -.5*(v.^2 +1i*v);
    gamma = kappa - rho*sigma*v*1i;
    PHI = sqrt(gamma.^2 - 2*sigma^2*zeta);    
    A = 1i.*v.*(x0 + r*T);
    B = v0*((2*zeta.*(1-exp(-PHI.*T)))./(2*PHI - (PHI-gamma).*(1-exp(-PHI*T))));
    C = -kappa*theta/sigma^2*(2*log((2*PHI - (PHI-gamma).*(1-exp(-PHI*T)))./ (2*PHI)) + (PHI-gamma)*T);
    cf = exp(A + B + C);
end