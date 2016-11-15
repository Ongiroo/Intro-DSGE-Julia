# julia 0.4
# Pkg.add("Calculus")
# Pkg.add("DataStructures")
# Pkg.add("FredData")
# Pkg.add("HDF5")
# Pkg.add("Optim")
# Pkg.add("QuantEcon")
# Pkg.add("Roots")
Pkg.add("DSGE")
Pkg.update()
Pkg.status()
Pkg.rm("Plots")
# Pkg.clone(https://github.com/FRBNY-DSGE/DSGE.jl.git, Actors)
using DSGE

# construct a model object
m = SmetsWouters()

# estimate as of 2015-Q3 using the default data vintage from 2015 Nov 27
m <= Setting(:data_vintage, "2")
m <= Setting(:date_mainsample_end, quartertodate("2015-Q3"))

# reoptimize parameter vector, compute Hessian at mode, and full posterior
# parameter sampling
estimate(m)

# produce LaTeX tables of parameter moments
compute_moments(m)
