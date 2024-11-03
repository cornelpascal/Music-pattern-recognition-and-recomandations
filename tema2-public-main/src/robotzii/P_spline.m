function y_interp = P_spline(coef, x, x_interp)
    n = length(x) - 1;
    y_interp = zeros(length(x_interp), 1);
    for j = 1:length(x_interp)
        xi = x_interp(j);
        for i = 1:n
            if xi >= x(i) && xi <= x(i+1)

                idx = 4*(i-1) + 1;
                a = coef(idx);
                b = coef(idx + 1);
                c = coef(idx + 2);
                d = coef(idx + 3);
                y_interp(j) = a + b * (xi - x(i)) + c * (xi - x(i))^2 + d * (xi - x(i))^3;
                break;
            end
        end
    end
end
