"""
    newton(x0, f, j; maxiter, tol)

Solution to f(x) = 0 where f'(x) = j(x) using Newton's method.
"""
function newton(x0, f, j; maxiter = 1000, tol = 1e-14)
    x = x0
    for _ in 1:maxiter
        fx = f(x)
        if abs(fx) < tol
            return x
        else
            x = x - (fx / j(x))
        end
    end
    return x
end

