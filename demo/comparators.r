### SHELL> mpiexec -np 4 Rscript --vanilla [...].r

### Setup environment.
suppressPackageStartupMessages(library(pbdDEMO, quiet = TRUE))

(function(){

on.exit(finalize())

if(comm.size() != 4){
  stop("This example requries 4 processors.")
}

rank <- comm.rank()

# demo

comm.cat("\ntest value:\n", quiet=T)
test <- (rank > 0)
comm.print(test, all.rank=T, quiet=T)
barrier()

comm.cat("\ncomm.all:\n", quiet=T)
test.all <- comm.all(test)
comm.print(test.all, all.rank=T, quiet=T)
barrier()

comm.cat("\ncomm.any:\n", quiet=T)
test.any <- comm.any(test)
comm.print(test.any, all.rank=T, quiet=T)
barrier()


comm.cat("\n\n\n", quiet=T)

### This is handy for managing, for example, whether all MPI processes 
# should halt based on the prejudices of just 1 process.

need2stop <- FALSE

if (rank==0){
  need2stop <- TRUE
}

need2stop <- comm.any(need2stop)

if (need2stop)
  stop("NOT AN ERROR, stopping here is the correct behavior of this demo.  See source for details.")

})()
#finalize()
