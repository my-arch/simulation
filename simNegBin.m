function w=simNegBin(p, n)
    % Simulation of Negative Binomial distribution
    % with shape parameter k = 3
    prec = 0.00001;
    q = 1 - p;
    a = q/p;

    r = (0.25 - a - a^2)*log(q)^2;

    y = [];
    for t = 1:n
        u = rand();
        x = 2*u*q^(a+1.5)*p^(-2)*log(q)^2;

        y(t) = ceil(halley(r,x,prec)/log(q) - a - 2.5);
    end
    w = y;
end