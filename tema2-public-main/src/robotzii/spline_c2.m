function coef = spline_c2 (x, y)
	% Remember that the indexes in Matlab start from 1, not 0

	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3
	% si'(x)  =      bi         + 2ci(x - xi)  + 3di(x - xi)^2
	% si''(x) =                   2ci          + 6di(x - xi)
    len = length(x) - 1;
    eq_matrix = zeros(4 * len);
	% TOOD 1: si(xi) = yi, i = 0 : n - 1
    for i = 1 : 4 : 4 * len
        eq_matrix((i - 1)/4 + 1, i) = 1;
    endfor

	% TODO 2: s_n-1(xn) = yn
    eq_matrix(len + 1, end - 3 : end) = (x(len + 1) - x(len)) .^ [0, 1, 2, 3];
	% TODO 3: si(x_i+1) = s_i+1(x_i+1), i = 0 : n - 2
    for i = 1 : len - 1
        eq_matrix(len + 1 + i, 4*i - 3: 4*i) = (x(i + 1) - x(i)) .^ [0, 1, 2, 3];
        eq_matrix(len + 1 + i, 4*i + 1) = -1;
    endfor

	% TODO 4: si'(x_i+1) = s_i+1'(x_i+1), i = 0 : n - 2
    for i = 1 : len - 1
        eq_matrix(2 * len + i, 4*i - 2: 4*i) = ((x(i + 1) - x(i)) .^ [0, 1, 2]) .* [1, 2, 3];
        eq_matrix(2 * len + i, 4*i + 2) = -1;
    endfor

	% TODO 5: si''(x_i+1) = s_i+1''(x_i+1), i = 0 : n - 2
    for i = 1 : len - 1
        eq_matrix(3 * len + i - 1, 4*i - 1) = 2;
		eq_matrix(3 * len + i - 1, 4*i) = 6 * (x(i + 1) - x(i));
		eq_matrix(3 * len + i - 1, 4*i + 3) = -2;
    endfor

	% TODO 6: s0''(x0) = 0
    eq_matrix(4 * len - 1, 3) = 2;

	% TODO 7: s_n-1''(x_n) = 0
    eq_matrix(4 * len, end - 1) = 2;
	eq_matrix(4 * len, end) = 6 * (x(len + 1) - x(len));
	% Solve the system of equations
    y_ext = zeros(4*len , 1);
    for i = 1 : length(y)
		y_ext(i) = y(i);
	end

    coef = eq_matrix \ y_ext;
end