# MyJuliaExampleをテストする
# 下記コマンドで実行:
# $ julia --project test/test_myjuliaexample.jl
using Test
using MyJuliaExample

@testset "Square関数" begin
    @test mysquare(2) == 4
    @test mysquare(3) == 9
end