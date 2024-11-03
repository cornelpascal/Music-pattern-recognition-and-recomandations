function y_interp = P_vandermonde(coef, x_interp)
    n_interp = length(x_interp);
    y_interp = zeros(n_interp, 1);
    coef = flipud(coef(:));
    for i = 1:n_interp
        x = x_interp(i);
        y = coef(1);
        for j = 2:length(coef)
            y = y * x + coef(j);
        end
        y_interp(i) = y;
    end
end
