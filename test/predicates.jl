@testset "predicates" verbose = true begin
    inc = [1.0, 2.0, 3.0, 3.0, 4.0]
    sinc = [1.0, 2.0, 3.0, 4.0, 5.0]
    ninc = [1.0, 2.0, 3.0, 2.0, 4.0]
    @test is_increasing(inc)
    @test !is_increasing(inc; strict=true)
    @test is_increasing(sinc; strict=true)
    @test !is_increasing(ninc)
end
