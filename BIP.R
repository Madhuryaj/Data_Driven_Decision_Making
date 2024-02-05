# mips - BIP
library(lpSolve)
objective.in <- c(2.0,3.6,3.2,1.6,2.8)
const.mat <- matrix(c(12,24,20,8,16),
                    nrow=1,byrow=TRUE)
const.dir <- c("<=")
const.rhs <- c(40)
lp(direction="max",objective.in,const.mat,const.dir,
   const.rhs,all.bin=TRUE)
lp(direction="max",objective.in,const.mat,const.dir,
   const.rhs,all.bin=TRUE)$solution
