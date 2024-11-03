function coef = vandermonde(x, y)
    % x = [x0, x1, ..., xn]'
    % y = [y0, y1, ..., yn]'
    % coef = [a0, a1, a2, ..., an]'

    % TODO: Calculate the Vandermonde coefficients
    n = length(x);
    A = zeros(n);
    A(1:n, 1) = 1;
    for i = [1 : n]
        for j = [1 : n]
            A(i, j) = x(i) .^ (j - 1);
        end
    end
    coef = A\y;
endfunction
