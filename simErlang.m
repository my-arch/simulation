function w=simErlang(lambda, n)
    prec = 0.00001;

    y = [];

    for t = 1:n
        u = rand();
        y(t) = -(halley(-1,2*u*exp(-1),prec) + 1)/lambda;
    end
    w = y;
end