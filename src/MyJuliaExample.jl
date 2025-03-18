module MyJuliaExample

export mysquare
function mysquare(x::Number)
    return x^2
end

include("MyOptim.jl")
using .MyOptim
export myminimize

end # module MyJuliaExample
