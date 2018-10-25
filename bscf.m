function y = bscf(logS, u, t, r, alpha, sig)
% Matsuda Page 115, (8.21)
u = u - (alpha+1)*1i;
y = exp( 1i*(logS + (r-.5*sig^2)*t)*u - .5*(sig^2)*t*(u.^2) );
end
