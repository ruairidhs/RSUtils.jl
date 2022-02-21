module RSUtils

export supnorm,
       fixedpoint,
       analytic_histogram

import Distributions

include("fixedpoint.jl")
include("statistics.jl")

end #module
