using RSUtils, Test
using Distributions: Distributions

@testset verbose = true "RSUtils.jl" begin
    include("fixedpoint.jl")
    include("statistics.jl")
    include("predicates.jl")
end
