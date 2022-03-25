@testset verbose = true "statistics" begin
    @testset "analytic_histogram" begin
        # check against uniform distribution
        d = Distributions.Uniform(0, 1)
        G = LinRange(0.0, 1.0, 10)
        res = analytic_histogram(d, G)

        @test res[1] ≈ step(G) / 2
        for i in 2:(length(G) - 1)
            @test res[i] ≈ step(G)
        end
        @test res[end] ≈ step(G) / 2
    end
end
