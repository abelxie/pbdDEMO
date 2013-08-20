library(pbdDEMO, quiet=T)
init.grid()

# set independent seeds using Rlecuyer
comm.set.seed(diff = TRUE)

# verify system solving at scale
pbdDEMO:::verify.solve(nrows=1e3)
pbdDEMO:::verify.inverse(nrows=1e3)
pbdDEMO:::verify.chol(nrows=1e3)
pbdDEMO:::verify.svd(nrows=1e3)

finalize()
