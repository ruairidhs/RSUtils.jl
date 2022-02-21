using RSUtils, Test
import Distributions

@testset verbose = true "RSUtils.jl" begin
    include("fixedpoint.jl")
    include("statistics.jl")
end
