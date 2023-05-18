
function y=halley(r,x,prec)
    W = lambertw(-1,-sqrt(x)/2);
    
    % Initializing function
    term(1) = (4*W^2)/(x*(4*W^2 + 4*W - r));
    term(2) = -(16*W^4*(4*W^2 + 8*W - r + 2))/(x^2*(4*W^2 + 4*W - r)^3);
    term(3) = (64*W^6*(32*W^4 + 128*W^3 - 16*W^2*r + 168*W^2 - 32*W*r + 72*W + 2*r^2 - 6*r + 12))/(x^3*(4*W^2 + 4*W - r)^5);
    term(4) = -(256*W^8*(384*W^6 + 2304*W^5 - 288*W^4*r + 5408*W^4 - 1152*W^3*r + 6080*W^3 + 72*W^2*r^2 - 1440*W^2*r + 3312*W^2 + 144*W*r^2 - 496*W*r + 960*W - 6*r^3 + 22*r^2 - 60*r + 120))/(x^4*(4*W^2 + 4*W - r)^7);
    term(5) = (1024*W^10*(6144*W^8 + 49152*W^7 - 6144*W^6*r + 165632*W^6 - 36864*W^5*r + 301184*W^5 + 2304*W^4*r^2 - 84416*W^4*r + 316480*W^4 + 9216*W^3*r^2 - 88256*W^3*r + 196480*W^3 - 384*W^2*r^3 + 11152*W^2*r^2 - 40320*W^2*r + 75360*W^2 - 768*W*r^3 + 3240*W*r^2 - 9120*W*r + 16800*W + 24*r^4 - 100*r^3 + 300*r^2 - 840*r + 1680))/(x^5*(4*W^2 + 4*W - r)^9);
    term(6) = -(4096*W^12*(122880*W^10 + 1228800*W^9 - 153600*W^8*r + 5389312*W^8 - 1228800*W^7*r + 13508096*W^7 + 76800*W^6*r^2 - 4077056*W^6*r + 21177856*W^6 + 460800*W^5*r^2 - 7121024*W^5*r + 21530112*W^5 - 19200*W^4*r^3 + 1036800*W^4*r^2 - 6892800*W^4*r + 14496000*W^4 - 76800*W^3*r^3 + 1027744*W^3*r^2 - 3687552*W^3*r + 6612480*W^3 + 2400*W^2*r^4 - 90784*W^2*r^3 + 406304*W^2*r^2 - 1155840*W^2*r + 1995840*W^2 + 4800*W*r^4 - 22936*W*r^3 + 73920*W*r^2 - 201600*W*r + 362880*W - 120*r^5 + 548*r^4 - 1680*r^3 + 5040*r^2 - 15120*r + 30240))/(x^6*(4*W^2 + 4*W - r)^11);

    tempSum = 0;
    
    % Using only first 3 terms
    for n=1:2
        tempSum = tempSum + r^n*exp(2*n*W)/factorial(n)*term(n);
    end
    
    w0 = tempSum + 2*W;
    
    w = real(w0);
    while (abs((w^2-r)*exp(w)-x) > prec)
        w = w - ((w^2-r)*exp(w)-x)/((w^2+2*w-r)*exp(w)-0.5*(w^2+4*w+2-r)/(w^2+2*w-r)*((w^2-r)*exp(w)-x));
    end
    y = w;
end