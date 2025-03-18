# MyJuliaExampleをテストする
# 下記コマンドで実行:
# $ julia --project test/test_myjuliaexample.jl
using Test
using MyJuliaExample  # MyOptimが認識されない

@testset "Square関数" begin
    @test mysquare(2) == 4
    @test mysquare(3) == 9
end

@testset "MyOptim関数" begin
    f(x) = x^2
    grad_f(x) = 2x
    x0 = 10
    option = Dict("max_iter" => 1000, "alpha" => 0.1, "atol" => 1e-10, "verbose" => true)
    x, fx = myminimize(f, grad_f, x0, option)
    @test isapprox(x, 0.0, atol=1e-3)
    # @test isapprox(fx, 0.0, atol=1e-6)
end