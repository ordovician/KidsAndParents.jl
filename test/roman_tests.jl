@testset "Roman tests" begin
    @testset "Basic roman to decimal" begin
        @test parse_roman("iii") == 3
        @test parse_roman("iiii") == 4
        @test parse_roman("iv") == 4
        @test parse_roman("IV") == 4
        @test parse_roman("VI") == 6
        @test parse_roman("V") == 5
    end
    
    @testset "Basic decimal to roman" begin
        @test roman(12) == "XII"
        @test roman(10) == "X"
        @test roman(11) == "XI"
        @test roman(144) == "CXLIV"
        @test roman(24) == "XXIV"
        @test roman(6)  == "VI"
        @test roman(246) == "CCXLVI"
    end
    
end