"""
    supnorm(u, v)

Find the largest element-wise difference between two collections.
"""
function supnorm(u, v)
    return maximum(abs.(u .- v))
end

"""
    fixedpoint(iterate!, init[, cache]; distance=supnorm, maxiter=1000, tol=1e-10)

Repeatedly call iterate!, starting with `init`, until an approximate fixed point is reached.

Two iterations must be stored in order to calculate the distance between operations.
These iterations are stored in `cache`, which can be optionally supplied to avoid allocations.

# Examples
```jldoctest
julia> init = [1.0, 2.0];

julia> cache = (similar(init), similar(init));

julia> function iterate!(x1, x0, β)
           x1 .= β .* x0
       end;

julia> fixedpoint((x1, x0) -> iterate!(x1, x0, 0.9), init, cache)
(value = [4.165953662869907e-10, 8.331907325739814e-10], err = 9.257674806377564e-11, iter = 205, converged = true)
```
"""
function fixedpoint(iterate!, init, cache; distance=supnorm, maxiter=1000, tol=1e-10)
    x0, x1 = cache
    copy!(x0, init)
    err = zero(eltype(init))

    for iter in 1:maxiter
        iterate!(x1, x0)
        err = distance(x1, x0)
        @debug "Iteration: $iter; Current error: $err"
        if err < tol
            return (value=x1, err=err, iter=iter, converged=true)
        else
            copy!(x0, x1)
        end
    end
    return (value=x1, err=err, iter=maxiter, converged=false)
end

function fixedpoint(iterate!, init; distance=supnorm, maxiter=1000, tol=1e-10)
    cache = (copy(init), copy(init))
    return fixedpoint(iterate!, init, cache; distance=distance, maxiter=maxiter, tol=tol)
end
