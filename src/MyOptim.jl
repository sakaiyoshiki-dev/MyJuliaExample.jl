module MyOptim
export myminimize

struct MinimizeOptions
    max_iter::Int
    alpha::Float64
end

"""
最急降下法により最小値を求める

# Arguments
- `f::Function`: 目的関数
- `grad_f::Function`: fの勾配
- `x0::Number`: 初期値

# Options
- `max_iter::Int=100`: 最大繰り返し回数
- `alpha::Float64=0.1`: 学習率
- `atol::Float64=1e-6`: 収束のしきい値
- `verbose::Bool=false`: ログを出力するかどうか

# Returns
- `x::Number`: 最小値を取るx
- `f(x)`: 最小値
"""
function myminimize(f::Function, grad_f::Function, x0::Number, option)

    # オプションの取得
    max_iter = get(option, "max_iter", 100)
    alpha = get(option, "alpha", 0.1)
    atol = get(option, "atol", 1e-6)
    verbose = get(option, "verbose", false)

    if verbose
        println("max_iter: $(max_iter), alpha: $(alpha), atol: $(atol)")
    end

    x = x0
    x_prev = x0
    fx_prev = f(x)
    best_f = f(x)
    success = false
    for n_iter in 1:max_iter

        # 最急降下法によるパラメータ更新
        x -= alpha * grad_f(x)
        fx = f(x)
        if fx < best_f
            best_f = fx
        end

        # ログの出力
        if verbose
            println("n_iter: $(n_iter), x: $(x), f(x): $(fx)")
        end

        # 収束判定
        if abs(fx - fx_prev) < atol
            success = true
            break
        end
        # 前の値を更新
        x_prev = x
        fx_prev = fx
    end
    # ログの出力
    if verbose
        # 収束に成功したか、x, f(x)を出力
        if !success
            println("収束しなかった")
        else
            println("収束した")
        end
        println("x: $(x), f(x): $(f(x))")
    end
    return x, f(x)
end

end # module MyOptim
