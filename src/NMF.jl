module NMF
    using Compat
    using StatsBase
    using Printf
    using LinearAlgebra
    using Statistics
    using Random

    import Compat: view
    import Base: sum!

    export nnmf

    include("common.jl")
    include("utils.jl")

    include("initialization.jl")
    include("multupd.jl")
    include("projals.jl")
    include("alspgrad.jl")

    include("interf.jl")

end # module
