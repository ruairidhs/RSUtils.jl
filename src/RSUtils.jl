module RSUtils

export supnorm,
       fixedpoint,
       analytic_histogram,
       sequential_compare,
       is_increasing

using Distributions: Distributions

include("fixedpoint.jl")
include("statistics.jl")
include("predicates.jl")

end #module
