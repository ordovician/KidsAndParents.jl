@testset "Dozenal tests" begin
    @testset "Dozenal lowercase and uppercase" begin
        @test parse_doz("x") == parse_doz("X")
        @test parse_doz("e") == parse_doz("E")
        @test parse_doz("1e") == parse_doz("1E")
        @test parse_doz("xee") == parse_doz("XEE")
        @test parse_doz("6x6") == parse_doz("6X6")
    end

    @testset "Basic dozenal to decimal" begin
        @test parse_doz("x") == 10
        @test parse_doz("e") == 11
        @test parse_doz("10") == 12
        @test parse_doz("1x") == 22
        @test parse_doz("20") == 24
        @test parse_doz("100") == 144
    end
    
    @testset "Basic decimal to dozenal" begin
        @test doz(12) == "10"
        @test doz(10) == "X"
        @test doz(11) == "E"
        @test doz(144) == "100"
        @test doz(24) == "20"
        @test doz(6)  == "6"
    end
    
end