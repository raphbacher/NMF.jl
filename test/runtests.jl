using NMF
using Compat
using Compat.Test
using Random
import Random: srand

tests = ["utils",
         "initialization",
         "alspgrad"]

println("Running tests:")
for t in tests
    tp = "$t.jl"
    println("* $tp ...")
    include(tp)
end
