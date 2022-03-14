module RSUtils

export supnorm,
       fixedpoint,
       analytic_histogram,
       newton

import Distributions

include("fixedpoint.jl")
include("optimization.jl")
include("statistics.jl")

end #module
