# some tests for ALSPGrad

# data

Random.seed!(5678)

p = 5
n = 8
k = 3

# Matrices
for T in (Float64, Float32)
    Wg = max.(rand(T, p, k) .- T(0.3), zero(T))
    Hg = max.(rand(T, k, n) .- T(0.3), zero(T))
    global X = Wg * Hg
    # test update of H

    global H = rand(T, k, n)
    NMF.alspgrad_updateh!(X, Wg, H; maxiter=200)
    @test all(H .>= 0.0)
    @test H ≈ Hg atol=eps(T)^(1/4)

    # test update of W

    global W = rand(T, p, k)
    println(X[2,2],W[2,2],Hg[2,2])
    NMF.alspgrad_updatew!(X, W, Hg; maxiter=200)
    @test all(W .>= 0.0)
    @test W ≈ Wg atol=eps(T)^(1/4)

    NMF.solve!(NMF.ALSPGrad{T}(), X, W, H)
end
