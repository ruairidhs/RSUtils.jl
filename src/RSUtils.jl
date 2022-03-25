module RSUtils

export supnorm,
       fixedpoint,
       analytic_histogram,
       sequential_compare,
       is_increasing,
       newton

using Distributions: Distributions

include("fixedpoint.jl")
include("optimization.jl")
include("statistics.jl")
include("predicates.jl")

end #module
