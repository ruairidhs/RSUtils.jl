@testset verbose = true "fixedpoint" begin
    @testset "supnorm" begin
        @test supnorm(ones(3), ones(3)) == 0.0
        @test supnorm(ones(3, 3, 3), ones(3, 3, 3)) == 0.0
        @test supnorm([1, 2, 3], [4, 4, 4]) == 3
    end

    @testset "fixedpoint" begin
        init = ones(10)
        cache = (ones(10) .* 2, ones(10) .* 3)
        function iterate!(x1, x0, β)
            return x1 .= β .* x0
        end
        # test a fixed point which converges
        res = fixedpoint((x1, x0) -> iterate!(x1, x0, 0.5), init, cache)
        @test res.converged
        @test supnorm(res.value, zeros(10)) <= 1e-10

        # test that the cache works
        res = fixedpoint((x1, x0) -> iterate!(x1, x0, 0.2), init)
        @test res.converged
        @test supnorm(res.value, zeros(10)) <= 1e-10

        # test a fixed point which doesn't converge
        res = fixedpoint((x1, x0) -> iterate!(x1, x0, 1.2), init, cache; maxiter=50)
        @test !res.converged
        @test res.iter == 50
    end
end
