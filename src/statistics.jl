"""
    analytic_histogram(d::Distributions.UnivariateDistribution, G::LinRange; normalize=true)

Compute the probability mass of `d` in equally-sized intervals with midpoints given by `G`.

If `normalize`, then the probabilities are re-scaled such that their sum is 1.
"""
function analytic_histogram(d::Distributions.UnivariateDistribution,
                            G::LinRange;
                            normalize=true)
    cdf(x) = Distributions.cdf(d, x)

    mps = get_midpoints(G)
    hist = zeros(length(G))
    for i in eachindex(hist)
        hist[i] = cdf(mps[i + 1]) - cdf(mps[i])
    end

    if normalize
        s = sum(hist)
        hist .= hist ./ s
    end

    return hist
end

# aux for analytic_histogram
function get_midpoints(G::LinRange)
    half_step = step(G) / 2
    return LinRange(first(G) - half_step,
                    last(G) + half_step,
                    length(G) + 1)
end
